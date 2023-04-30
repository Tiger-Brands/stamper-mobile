/// Generated file. Do not edit.
///
/// Locales: 6
/// Strings: 114 (19 per locale)
///
/// Built on 2023-04-30 at 16:05 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, TranslationsEn> {
	en(languageCode: 'en', build: TranslationsEn.build),
	ar(languageCode: 'ar', build: TranslationsAr.build),
	de(languageCode: 'de', build: TranslationsDe.build),
	es(languageCode: 'es', build: TranslationsEs.build),
	fr(languageCode: 'fr', build: TranslationsFr.build),
	zh(languageCode: 'zh', build: TranslationsZh.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, TranslationsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	TranslationsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of Loc).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = Loc.someKey.anotherKey;
TranslationsEn get Loc => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final Loc = Translations.of(context); // Get Loc variable.
/// String a = Loc.someKey.anotherKey; // Use Loc variable.
class Translations {
	Translations._(); // no constructor

	static TranslationsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, TranslationsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, TranslationsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.Loc.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	TranslationsEn get Loc => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, TranslationsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, TranslationsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// context enums

enum GenderContext {
	male,
	female,
}

// interfaces generated as mixins

mixin PageData2 {
	String get title;
	String? get content => null;

	@override
	bool operator ==(Object other) => other is PageData2 && title == other.title && content == other.content;

	@override
	int get hashCode => title.hashCode * content.hashCode;
}

// translations

// Path: <root>
class TranslationsEn implements BaseTranslations<AppLocale, TranslationsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	String get greetings => 'Hello';
	String get welcome => 'Welcome';
	String get login => 'Login';
	String get register => 'Register';
	String get recent_files => 'Recent Files';
	String get exam_documents => 'Exam Documents';
	String get exam_results => 'Exam Results';
	String get exam_schedule => 'Exam Schedule';
	String get work_documents => 'Work Documents';
	String get school_documents => 'School Documents';
	String get clicktoupload => 'Click to upload files';
	String get upload => 'Upload';
	String get search_files_folders => 'Search Files and Folders';
	String get files => 'Files';
	String get stamp => 'Stamp';
	String get profile => 'Profile';
	String get user_files_overview => 'User Files Overview and stats';
	String get upload_a_document_to_start => 'Upload a document to stamp and share with no stress';
	String get dark_mode => 'Dark Mode';
}

// Path: <root>
class TranslationsAr extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	@override late final TranslationsAr _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'مرحبًا';
	@override String get welcome => 'أهلاً وسهلاً';
	@override String get login => 'تسجيل الدخول';
	@override String get register => 'تسجيل';
	@override String get recent_files => 'الملفات الأخيرة';
	@override String get exam_documents => 'وثائق الاختبار';
	@override String get exam_results => 'نتائج الاختبار';
	@override String get exam_schedule => 'جدول الاختبارات';
	@override String get work_documents => 'وثائق العمل';
	@override String get school_documents => 'وثائق المدرسة';
	@override String get clicktoupload => 'انقر لتحميل الملفات';
	@override String get upload => 'تحميل';
	@override String get search_files_folders => 'البحث عن الملفات والمجلدات';
	@override String get files => 'ملفات';
	@override String get stamp => 'ختم';
	@override String get profile => 'الملف الشخصي';
	@override String get user_files_overview => 'نظرة عامة على ملفات المستخدم والإحصائيات';
	@override String get upload_a_document_to_start => 'تحميل وثيقة للختم والمشاركة بدون توتر';
	@override String get dark_mode => 'الوضع الداكن';
}

// Path: <root>
class TranslationsDe extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	@override late final TranslationsDe _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Hallo';
	@override String get welcome => 'Willkommen';
	@override String get login => 'Anmeldung';
	@override String get register => 'Registrieren';
	@override String get recent_files => 'Letzte Dateien';
	@override String get exam_documents => 'Prüfungsdokumente';
	@override String get exam_results => 'Prüfungsergebnisse';
	@override String get exam_schedule => 'Prüfungsplan';
	@override String get work_documents => 'Arbeitsdokumente';
	@override String get school_documents => 'Schuldokumente';
	@override String get clicktoupload => 'Klicken Sie zum Hochladen von Dateien';
	@override String get upload => 'Hochladen';
	@override String get search_files_folders => 'Dateien und Ordner suchen';
	@override String get files => 'Dateien';
	@override String get stamp => 'Stempel';
	@override String get profile => 'Profil';
	@override String get user_files_overview => 'Übersicht und Statistiken zu Benutzerdateien';
	@override String get upload_a_document_to_start => 'Laden Sie ein Dokument hoch, um es zu stempeln und stressfrei zu teilen';
	@override String get dark_mode => 'Dunkler Modus';
}

// Path: <root>
class TranslationsEs extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	@override late final TranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Hola';
	@override String get welcome => 'Bienvenido';
	@override String get login => 'Iniciar sesión';
	@override String get register => 'Registrarse';
	@override String get recent_files => 'Archivos recientes';
	@override String get exam_documents => 'Documentos de examen';
	@override String get exam_results => 'Resultados de examen';
	@override String get exam_schedule => 'Calendario de examen';
	@override String get work_documents => 'Documentos de trabajo';
	@override String get school_documents => 'Documentos escolares';
	@override String get clicktoupload => 'Haga clic para cargar archivos';
	@override String get upload => 'Subir';
	@override String get search_files_folders => 'Buscar archivos y carpetas';
	@override String get files => 'Archivos';
	@override String get stamp => 'Sello';
	@override String get profile => 'Perfil';
	@override String get user_files_overview => 'Resumen y estadísticas de archivos de usuario';
	@override String get upload_a_document_to_start => 'Cargue un documento para estampar y compartir sin estrés';
	@override String get dark_mode => 'Modo oscuro';
}

// Path: <root>
class TranslationsFr extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	@override late final TranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Bonjour';
	@override String get welcome => 'Bienvenue';
	@override String get login => 'Connexion';
	@override String get register => 'S\'inscrire';
	@override String get recent_files => 'Fichiers récents';
	@override String get exam_documents => 'Documents d\'examen';
	@override String get exam_results => 'Résultats d\'examen';
	@override String get exam_schedule => 'Horaire des examens';
	@override String get work_documents => 'Documents de travail';
	@override String get school_documents => 'Documents scolaires';
	@override String get clicktoupload => 'Cliquez pour télécharger des fichiers';
	@override String get upload => 'Télécharger';
	@override String get search_files_folders => 'Rechercher des fichiers et des dossiers';
	@override String get files => 'Fichiers';
	@override String get stamp => 'Tampon';
	@override String get profile => 'Profil';
	@override String get user_files_overview => 'Aperçu et statistiques des fichiers de l\'utilisateur';
	@override String get upload_a_document_to_start => 'Téléchargez un document pour le tamponner et le partager sans stress';
	@override String get dark_mode => 'Mode sombre';
}

// Path: <root>
class TranslationsZh extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	@override late final TranslationsZh _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => '你好';
	@override String get welcome => '欢迎';
	@override String get login => '登录';
	@override String get register => '注册';
	@override String get recent_files => '最近文件';
	@override String get exam_documents => '考试文件';
	@override String get exam_results => '考试结果';
	@override String get exam_schedule => '考试日程';
	@override String get work_documents => '工作文件';
	@override String get school_documents => '学校文件';
	@override String get clicktoupload => '点击上传文件';
	@override String get upload => '上传';
	@override String get search_files_folders => '搜索文件和文件夹';
	@override String get files => '文件';
	@override String get stamp => '戳';
	@override String get profile => '个人资料';
	@override String get user_files_overview => '用户文件概览和统计信息';
	@override String get upload_a_document_to_start => '上传一个文件进行戳章和无压力地共享';
	@override String get dark_mode => '暗模式';
}
