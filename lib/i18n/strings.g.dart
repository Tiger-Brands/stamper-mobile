/// Generated file. Do not edit.
///
/// Locales: 6
/// Strings: 114 (19 per locale)
///
/// Built on 2023-05-01 at 12:57 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ar(languageCode: 'ar', build: _StringsAr.build),
	de(languageCode: 'de', build: _StringsDe.build),
	es(languageCode: 'es', build: _StringsEs.build),
	fr(languageCode: 'fr', build: _StringsFr.build),
	zh(languageCode: 'zh', build: _StringsZh.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

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
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
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
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get greetings => 'Hello';
	String get welcome => 'Welcome';
	String get login => 'Login';
	String get register => 'Register';
	String get recentFiles => 'Recent Files';
	String get examDocuments => 'Exam Documents';
	String get examResults => 'Exam Results';
	String get examSchedule => 'Exam Schedule';
	String get workDocuments => 'Work Documents';
	String get schoolDocuments => 'School Documents';
	String get clicktoupload => 'Click to upload files';
	String get upload => 'Upload';
	String get searchFilesFolders => 'Search Files and Folders';
	String get files => 'Files';
	String get stamp => 'Stamp';
	String get profile => 'Profile';
	String get userFilesOverview => 'User Files Overview and stats';
	String get uploadADocumentToStart => 'Upload a document to stamp and share with no stress';
	String get darkMode => 'Dark Mode';
}

// Path: <root>
class _StringsAr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'مرحبًا';
	@override String get welcome => 'أهلاً وسهلاً';
	@override String get login => 'تسجيل الدخول';
	@override String get register => 'تسجيل';
	@override String get recentFiles => 'الملفات الأخيرة';
	@override String get examDocuments => 'وثائق الاختبار';
	@override String get examResults => 'نتائج الاختبار';
	@override String get examSchedule => 'جدول الاختبارات';
	@override String get workDocuments => 'وثائق العمل';
	@override String get schoolDocuments => 'وثائق المدرسة';
	@override String get clicktoupload => 'انقر لتحميل الملفات';
	@override String get upload => 'تحميل';
	@override String get searchFilesFolders => 'البحث عن الملفات والمجلدات';
	@override String get files => 'ملفات';
	@override String get stamp => 'ختم';
	@override String get profile => 'الملف الشخصي';
	@override String get userFilesOverview => 'نظرة عامة على ملفات المستخدم والإحصائيات';
	@override String get uploadADocumentToStart => 'تحميل وثيقة للختم والمشاركة بدون توتر';
	@override String get darkMode => 'الوضع الداكن';
}

// Path: <root>
class _StringsDe implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsDe.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsDe _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Hallo';
	@override String get welcome => 'Willkommen';
	@override String get login => 'Anmeldung';
	@override String get register => 'Registrieren';
	@override String get recentFiles => 'Letzte Dateien';
	@override String get examDocuments => 'Prüfungsdokumente';
	@override String get examResults => 'Prüfungsergebnisse';
	@override String get examSchedule => 'Prüfungsplan';
	@override String get workDocuments => 'Arbeitsdokumente';
	@override String get schoolDocuments => 'Schuldokumente';
	@override String get clicktoupload => 'Klicken Sie zum Hochladen von Dateien';
	@override String get upload => 'Hochladen';
	@override String get searchFilesFolders => 'Dateien und Ordner suchen';
	@override String get files => 'Dateien';
	@override String get stamp => 'Stempel';
	@override String get profile => 'Profil';
	@override String get userFilesOverview => 'Übersicht und Statistiken zu Benutzerdateien';
	@override String get uploadADocumentToStart => 'Laden Sie ein Dokument hoch, um es zu stempeln und stressfrei zu teilen';
	@override String get darkMode => 'Dunkler Modus';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Hola';
	@override String get welcome => 'Bienvenido';
	@override String get login => 'Iniciar sesión';
	@override String get register => 'Registrarse';
	@override String get recentFiles => 'Archivos recientes';
	@override String get examDocuments => 'Documentos de examen';
	@override String get examResults => 'Resultados de examen';
	@override String get examSchedule => 'Calendario de examen';
	@override String get workDocuments => 'Documentos de trabajo';
	@override String get schoolDocuments => 'Documentos escolares';
	@override String get clicktoupload => 'Haga clic para cargar archivos';
	@override String get upload => 'Subir';
	@override String get searchFilesFolders => 'Buscar archivos y carpetas';
	@override String get files => 'Archivos';
	@override String get stamp => 'Sello';
	@override String get profile => 'Perfil';
	@override String get userFilesOverview => 'Resumen y estadísticas de archivos de usuario';
	@override String get uploadADocumentToStart => 'Cargue un documento para estampar y compartir sin estrés';
	@override String get darkMode => 'Modo oscuro';
}

// Path: <root>
class _StringsFr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => 'Bonjour';
	@override String get welcome => 'Bienvenue';
	@override String get login => 'Connexion';
	@override String get register => 'S\'inscrire';
	@override String get recentFiles => 'Fichiers récents';
	@override String get examDocuments => 'Documents d\'examen';
	@override String get examResults => 'Résultats d\'examen';
	@override String get examSchedule => 'Horaire des examens';
	@override String get workDocuments => 'Documents de travail';
	@override String get schoolDocuments => 'Documents scolaires';
	@override String get clicktoupload => 'Cliquez pour télécharger des fichiers';
	@override String get upload => 'Télécharger';
	@override String get searchFilesFolders => 'Rechercher des fichiers et des dossiers';
	@override String get files => 'Fichiers';
	@override String get stamp => 'Tampon';
	@override String get profile => 'Profil';
	@override String get userFilesOverview => 'Aperçu et statistiques des fichiers de l\'utilisateur';
	@override String get uploadADocumentToStart => 'Téléchargez un document pour le tamponner et le partager sans stress';
	@override String get darkMode => 'Mode sombre';
}

// Path: <root>
class _StringsZh implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsZh _root = this; // ignore: unused_field

	// Translations
	@override String get greetings => '你好';
	@override String get welcome => '欢迎';
	@override String get login => '登录';
	@override String get register => '注册';
	@override String get recentFiles => '最近文件';
	@override String get examDocuments => '考试文件';
	@override String get examResults => '考试结果';
	@override String get examSchedule => '考试日程';
	@override String get workDocuments => '工作文件';
	@override String get schoolDocuments => '学校文件';
	@override String get clicktoupload => '点击上传文件';
	@override String get upload => '上传';
	@override String get searchFilesFolders => '搜索文件和文件夹';
	@override String get files => '文件';
	@override String get stamp => '戳';
	@override String get profile => '个人资料';
	@override String get userFilesOverview => '用户文件概览和统计信息';
	@override String get uploadADocumentToStart => '上传一个文件进行戳章和无压力地共享';
	@override String get darkMode => '暗模式';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return 'Hello';
			case 'welcome': return 'Welcome';
			case 'login': return 'Login';
			case 'register': return 'Register';
			case 'recentFiles': return 'Recent Files';
			case 'examDocuments': return 'Exam Documents';
			case 'examResults': return 'Exam Results';
			case 'examSchedule': return 'Exam Schedule';
			case 'workDocuments': return 'Work Documents';
			case 'schoolDocuments': return 'School Documents';
			case 'clicktoupload': return 'Click to upload files';
			case 'upload': return 'Upload';
			case 'searchFilesFolders': return 'Search Files and Folders';
			case 'files': return 'Files';
			case 'stamp': return 'Stamp';
			case 'profile': return 'Profile';
			case 'userFilesOverview': return 'User Files Overview and stats';
			case 'uploadADocumentToStart': return 'Upload a document to stamp and share with no stress';
			case 'darkMode': return 'Dark Mode';
			default: return null;
		}
	}
}

extension on _StringsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return 'مرحبًا';
			case 'welcome': return 'أهلاً وسهلاً';
			case 'login': return 'تسجيل الدخول';
			case 'register': return 'تسجيل';
			case 'recentFiles': return 'الملفات الأخيرة';
			case 'examDocuments': return 'وثائق الاختبار';
			case 'examResults': return 'نتائج الاختبار';
			case 'examSchedule': return 'جدول الاختبارات';
			case 'workDocuments': return 'وثائق العمل';
			case 'schoolDocuments': return 'وثائق المدرسة';
			case 'clicktoupload': return 'انقر لتحميل الملفات';
			case 'upload': return 'تحميل';
			case 'searchFilesFolders': return 'البحث عن الملفات والمجلدات';
			case 'files': return 'ملفات';
			case 'stamp': return 'ختم';
			case 'profile': return 'الملف الشخصي';
			case 'userFilesOverview': return 'نظرة عامة على ملفات المستخدم والإحصائيات';
			case 'uploadADocumentToStart': return 'تحميل وثيقة للختم والمشاركة بدون توتر';
			case 'darkMode': return 'الوضع الداكن';
			default: return null;
		}
	}
}

extension on _StringsDe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return 'Hallo';
			case 'welcome': return 'Willkommen';
			case 'login': return 'Anmeldung';
			case 'register': return 'Registrieren';
			case 'recentFiles': return 'Letzte Dateien';
			case 'examDocuments': return 'Prüfungsdokumente';
			case 'examResults': return 'Prüfungsergebnisse';
			case 'examSchedule': return 'Prüfungsplan';
			case 'workDocuments': return 'Arbeitsdokumente';
			case 'schoolDocuments': return 'Schuldokumente';
			case 'clicktoupload': return 'Klicken Sie zum Hochladen von Dateien';
			case 'upload': return 'Hochladen';
			case 'searchFilesFolders': return 'Dateien und Ordner suchen';
			case 'files': return 'Dateien';
			case 'stamp': return 'Stempel';
			case 'profile': return 'Profil';
			case 'userFilesOverview': return 'Übersicht und Statistiken zu Benutzerdateien';
			case 'uploadADocumentToStart': return 'Laden Sie ein Dokument hoch, um es zu stempeln und stressfrei zu teilen';
			case 'darkMode': return 'Dunkler Modus';
			default: return null;
		}
	}
}

extension on _StringsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return 'Hola';
			case 'welcome': return 'Bienvenido';
			case 'login': return 'Iniciar sesión';
			case 'register': return 'Registrarse';
			case 'recentFiles': return 'Archivos recientes';
			case 'examDocuments': return 'Documentos de examen';
			case 'examResults': return 'Resultados de examen';
			case 'examSchedule': return 'Calendario de examen';
			case 'workDocuments': return 'Documentos de trabajo';
			case 'schoolDocuments': return 'Documentos escolares';
			case 'clicktoupload': return 'Haga clic para cargar archivos';
			case 'upload': return 'Subir';
			case 'searchFilesFolders': return 'Buscar archivos y carpetas';
			case 'files': return 'Archivos';
			case 'stamp': return 'Sello';
			case 'profile': return 'Perfil';
			case 'userFilesOverview': return 'Resumen y estadísticas de archivos de usuario';
			case 'uploadADocumentToStart': return 'Cargue un documento para estampar y compartir sin estrés';
			case 'darkMode': return 'Modo oscuro';
			default: return null;
		}
	}
}

extension on _StringsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return 'Bonjour';
			case 'welcome': return 'Bienvenue';
			case 'login': return 'Connexion';
			case 'register': return 'S\'inscrire';
			case 'recentFiles': return 'Fichiers récents';
			case 'examDocuments': return 'Documents d\'examen';
			case 'examResults': return 'Résultats d\'examen';
			case 'examSchedule': return 'Horaire des examens';
			case 'workDocuments': return 'Documents de travail';
			case 'schoolDocuments': return 'Documents scolaires';
			case 'clicktoupload': return 'Cliquez pour télécharger des fichiers';
			case 'upload': return 'Télécharger';
			case 'searchFilesFolders': return 'Rechercher des fichiers et des dossiers';
			case 'files': return 'Fichiers';
			case 'stamp': return 'Tampon';
			case 'profile': return 'Profil';
			case 'userFilesOverview': return 'Aperçu et statistiques des fichiers de l\'utilisateur';
			case 'uploadADocumentToStart': return 'Téléchargez un document pour le tamponner et le partager sans stress';
			case 'darkMode': return 'Mode sombre';
			default: return null;
		}
	}
}

extension on _StringsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'greetings': return '你好';
			case 'welcome': return '欢迎';
			case 'login': return '登录';
			case 'register': return '注册';
			case 'recentFiles': return '最近文件';
			case 'examDocuments': return '考试文件';
			case 'examResults': return '考试结果';
			case 'examSchedule': return '考试日程';
			case 'workDocuments': return '工作文件';
			case 'schoolDocuments': return '学校文件';
			case 'clicktoupload': return '点击上传文件';
			case 'upload': return '上传';
			case 'searchFilesFolders': return '搜索文件和文件夹';
			case 'files': return '文件';
			case 'stamp': return '戳';
			case 'profile': return '个人资料';
			case 'userFilesOverview': return '用户文件概览和统计信息';
			case 'uploadADocumentToStart': return '上传一个文件进行戳章和无压力地共享';
			case 'darkMode': return '暗模式';
			default: return null;
		}
	}
}
