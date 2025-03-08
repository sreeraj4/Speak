final Map<String, String> languageMap = {
  'Arabic':'ar',
  'Assamese':'as',
  'Bengali':'bn',
  'English': 'en',
  'French': 'fr',
  'German': 'de',
  'Gujarati':'gu',
  'Hebrew':'iw',
  'Hindi': 'hi',
  'Japanese':'ja',
  'Kannada': 'kn',
  'Konkani':'gom',
  'Malayalam':'ml',
  'Russian':'ru',
  'Sanskrit':'sa',
  'Spanish': 'es',
  'Tamil':'ta',
  'Telugu':'te',
  'Thai':'th',
};

final Map<String, String> talklanguageMap = {
  'Arabic':'ar-AE',
  'Assamese':'as-IN',
  'Bengali':'bn-IN',
  'English': 'en-US',
  'French': 'fr-FR',
  'German': 'de-DE',
  'Gujarati':'gu-IN',
  'Hebrew':'iw-IL',
  'Hindi': 'hi-IN',
  'Japanese':'ja-JP',
  'Kannada': 'kn-IN',
  'Konkani':'gom-IN',
  'Malayalam':'ml-IN',
  'Russian':'ru-RUS',
  'Sanskrit':'sa-IN',
  'Spanish': 'es-ES',
  'Tamil':'ta-IN',
  'Telugu':'te-IN',
  'Thai':'th-TH',
};

List<Map<String, String>> availableVoices = [
  {"name": "Male", "value": "en-us-x-sfg#male_1-local"},
  {"name": "Female", "value": "en-us-x-sfg#female_1-local"},
  {"name": "Robot", "value": "en-us-x-sfg#robot-local"},
];


final List<Map<String,String>> questionAnswer =[
{"Q":"How do I translate text?","A":"Simply enter text and press 'Translate' button."},
{"Q": "How do I enable speech translation","A":"Go to 'Speech' tab and clic the mic button and select the language."},
  {"Q":"How to hear translated text?","A":"Click on 'Volume Icon' to hear the translated text"},
  {"Q":"Is there any way to copy translated text?","A":"Yes, there is option to copy translated text to clipboard"}
];