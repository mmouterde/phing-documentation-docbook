<?php
require_once 'phing/Task.php';

class WebsiteExtractMenuTask extends Task
{
    protected $_htmlIndexFile;
    protected $_dataOutputFile;
    
    public function setHtmlIndexFile($a) {
        $this->_htmlIndexFile = $a;
    }
    
    public function setDataOutputFile($a) {
        $this->_dataOutputFile = $a;
    }
    
    public function main()
    {
        $this->log("Extracting menu from {$this->_htmlIndexFile} to {$this->_dataOutputFile}", Project::MSG_VERBOSE);
        
        $dom = new DOMDocument();
        $dom->loadHTMLFile($this->_htmlIndexFile);
        $xpath = new DOMXPath($dom);
        
        $result = array();
        
        $listToc = $xpath->query('//div[@class="toc"]');
        if ($listToc->length > 0) {
            $toc = $listToc->item(0);
            foreach ($toc->childNodes as $child) {
                if ($child->nodeType === XML_ELEMENT_NODE && $child->tagName === 'dl') {
                    $this->dl($child, 0, $result);
                }
            }
        }
        
        $str = serialize($result);
        file_put_contents($this->_dataOutputFile, $str);
        
    }
    
    protected function dl(DOMElement $dl, $depth=0, array & $result) {
        $current = array();
        foreach ($dl->childNodes as $child) {
            if ($child->nodeType === XML_ELEMENT_NODE) {
                /* @var $child DOMElement */
                if ($child->tagName === 'dt') {
                    $as = $child->getElementsByTagName('a');
                    if ($as->length > 0) {
                        foreach ($as as $a) {
                            $current['text'] = $this->clean($a->nodeValue);
                            $current['href'] = $a->getAttribute('href');
                            $current['depth'] = $depth;
                            $result[md5($current['href'])] = $current;
                        }
                    }
                }
                else if ($child->tagName === 'dd') {
                    $listDl = $child->getElementsByTagName('dl');
                    if ($listDl->length > 0) {
                        $current['children'] = array();
                        $this->dl($listDl->item(0), $depth+1, $current['children']);
                        $result[md5($current['href'])] = $current;
                    }
                }
            }
        }
    }
    
    protected function clean($str) {
        return preg_replace('/\s+/', ' ', $str);
    }
}
