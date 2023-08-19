namespace Other;

public class OtherClass {
   public static void PublicMethod() {
      Console.WriteLine("hi I'm public!");
   }
   
   private static void PrivateMethod() {
      Console.WriteLine("hi I'm private!");
   }
   
   internal static void InternalMethod() {
      Console.WriteLine("hi I'm internal!");
   }
   
   protected static void ProtectedMethod() {
      Console.WriteLine("hi I'm protected!");
   }
   
   protected internal static void ProtectedInternalMethod() {
      Console.WriteLine("hi I'm protected internal!");
   }
   
   private protected static void PrivateProtected() {
      Console.WriteLine("hi I'm private protected!");
   }
   
   private static void OtherClassTesting() {
   }
}