/** Definitions related to `java.util.regex`. */

private import semmle.code.java.dataflow.ExternalFlow

/** The class `java.util.regex.Pattern`. */
class TypeRegexPattern extends Class {
  TypeRegexPattern() { this.hasQualifiedName("java.util.regex", "Pattern") }
}

/** The `quote` method of the `java.util.regex.Pattern` class. */
class PatternQuoteMethod extends Method {
  PatternQuoteMethod() {
    this.getDeclaringType() instanceof TypeRegexPattern and
    this.hasName("quote")
  }
}

/** The `LITERAL` field of the `java.util.regex.Pattern` class. */
class PatternLiteralField extends Field {
  PatternLiteralField() {
    this.getDeclaringType() instanceof TypeRegexPattern and
    this.hasName("LITERAL")
  }
}

private class RegexModel extends SummaryModelCsv {
  override predicate row(string s) {
    s =
      [
        //`namespace; type; subtypes; name; signature; ext; input; output; kind`
        "java.util.regex;Matcher;false;group;;;Argument[-1];ReturnValue;taint;manual",
        "java.util.regex;Matcher;false;replaceAll;;;Argument[-1];ReturnValue;taint;manual",
        "java.util.regex;Matcher;false;replaceAll;;;Argument[0];ReturnValue;taint;manual",
        "java.util.regex;Matcher;false;replaceFirst;;;Argument[-1];ReturnValue;taint;manual",
        "java.util.regex;Matcher;false;replaceFirst;;;Argument[0];ReturnValue;taint;manual",
        "java.util.regex;Pattern;false;matcher;;;Argument[0];ReturnValue;taint;manual",
        "java.util.regex;Pattern;false;quote;;;Argument[0];ReturnValue;taint;manual",
        "java.util.regex;Pattern;false;split;;;Argument[0];ReturnValue;taint;manual",
      ]
  }
}
