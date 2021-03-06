This file contains snippets of useful docbook tags, which are to be used as much as possible.
<br>*For example, the parameters list for a Task must always use the same markup => use what's given here*


# Documenting Tasks #


## Empty skeleton, for a Task ##

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE refentry [
        <!ENTITY % entities SYSTEM "../../entities.ent">
        %entities;
    ]>
    <refentry xml:id="phing.coretasks."
              xmlns="http://docbook.org/ns/docbook"
              xmlns:ns6="http://www.w3.org/1999/xlink"
              xmlns:ns5="http://www.w3.org/1998/Math/MathML"
              xmlns:ns4="http://www.w3.org/1999/xhtml"
              xmlns:ns3="http://www.w3.org/2000/svg"
              xmlns:ns="http://docbook.org/ns/docbook"
              version="5.0">
        <refnamediv>
            <refname></refname>
            <refpurpose></refpurpose>
        </refnamediv>

    </refentry>



## Notes ##

Useful if some information is to be present on the documentation page of a Task, but doesn't fit in sections
such as `parameters`, `example`, ...

    <refsect1 role="note">
        &ref.title.note;
        <para></para>
    </refsect1>



## Parameters, for a Task (table with 5 columns) ##

    <refsect1 role="parameters">
        &ref.title.attributes;
        <table xml:id=".parameters">
            <caption>Attributes for <classname></classname></caption>
            &taskAttributes.table.titlesLine.all;
            <tr>
                <td class="name"><parameter></parameter></td>
                <td class="type"><type></type></td>
                <td class="description"></td>
                <td class="default"></td>
                <td class="required"></td>
            </tr>
            
        </table>
    </refsect1>

Entities that can / must be used *(especially for `default` and `required` columns)* :

    &attributes.defaultValue.NA;
    &attributes.required.yes;
    &attributes.required.no;



## Supported nested tags, for a Task ##

    <refsect1 role="nested">
        &ref.title.supportedNestedTags;
        <itemizedlist>
            <listitem><para><xref linkend="phing.coretypes.fileset" /></para></listitem>
        </itemizedlist>
    </refsect1>

    <refsect1 role="nested">
        &ref.title.supportedNestedTags;
        <itemizedlist>
            <listitem><para><link linkend=""><code>&lt;&gt;</code></link></para></listitem>
        </itemizedlist>
    </refsect1>

    <refsect1 role="nested">
        &ref.title.supportedNestedTags;
        <itemizedlist>
            <listitem><para><code>&lt;&gt;</code></para></listitem>
        </itemizedlist>
    </refsect1>



## Example, for a Task *(some `<para>` can be added, if necessary)* ##

    <refsect1 role="example">
        &ref.title.example;
        <programlisting language="xml"><![CDATA[]]></programlisting>
    </refsect1>

    <refsect1 role="example">
        &ref.title.example;
        <programlisting language="xml"><![CDATA[]]></programlisting>
        <para></para>
    </refsect1>



## Attributes *(table with 3 columns)* ##

    <table xml:id=".attributes">
        <caption></caption>
        &attributes.table.titlesLine.all;
        <tr>
            <td><parameter></parameter></td>
            <td></td>
            <td></td>
        </tr>

    </table>



