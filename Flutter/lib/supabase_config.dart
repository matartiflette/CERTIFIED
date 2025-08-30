import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://cflqwiwibzcpduzqpeje.supabase.co';
  static const String supabaseKey =
      'sb_publishable_6y7rVOrcxoNnFcTRdUtAQA_wxQXN2G1';
  static const String supabaseSecret =
      'sb_secret_WSolPOv3Brl4qHCTfKkA3Q_MlyRDKd0';

  static SupabaseClient get client {
    return SupabaseClient(supabaseUrl, supabaseKey);
  }
}
