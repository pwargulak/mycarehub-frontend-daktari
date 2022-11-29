// Package imports:

import 'package:sghi_core/app_wrapper/enums.dart';

const List<AppContext> testAppContexts = <AppContext>[
  AppContext.AfyaMoja,
  AppContext.AppTest
];

const List<AppContext> demoAppContexts = <AppContext>[
  AppContext.AfyaMoja,
  AppContext.AppDemo
];

const List<AppContext> prodAppContexts = <AppContext>[
  AppContext.AfyaMoja,
  AppContext.AppProd
];

// TODO(abiud): this is temporary> Use AppContext.AppExternal from app_wrapper
const List<AppContext> externalAppContexts = <AppContext>[
  AppContext.AfyaMoja,
  AppContext.AppE2E
];
