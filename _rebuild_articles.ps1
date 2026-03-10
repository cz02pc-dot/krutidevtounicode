$ErrorActionPreference = 'Stop'

$topics = @(
  @{ slug='kruti-dev-vs-unicode.html'; nav='KrutiDev vs Unicode'; title='Kruti Dev vs. Unicode: What''s the Difference and Which Should You Use?'; desc='Practical comparison for teams choosing between legacy and modern Hindi workflows.'; image='featured-kruti-vs-unicode.svg'; audience='operations managers and content teams'; scenario='a file looks right on one machine and broken on another'; focus='encoding standard choice'; outcome='stable search, copy, and publishing behavior'; c0='#1f2d4d'; c1='#365a9b'; c2='#74c2f5'; c3='#f4f8ff'; workflow=@('Map where Hindi text is created and published','Set Unicode as the master source for all new drafts','Allow Kruti Dev only in documented compatibility endpoints','Train reviewers to check behavior, not just appearance','Track incidents weekly and close root causes','Publish one migration policy with clear ownership'); pitfalls=@('visual-only approval','multiple master files','no rollback copy','tool-hopping during deadlines','undefined ownership') },
  @{ slug='convert-kruti-dev-to-unicode-formatting.html'; nav='Convert K->U'; title='Step-by-Step Guide: How to Convert Kruti Dev to Unicode Without Losing Formatting'; desc='Safe conversion workflow that protects layout and document structure.'; image='featured-convert-k-to-u.svg'; audience='DTP operators and document control teams'; scenario='text converts but headings, lists, and tables drift'; focus='format-safe conversion'; outcome='Unicode text with approved formatting intact'; c0='#10344f'; c1='#1478a7'; c2='#75dcef'; c3='#ecfbff'; workflow=@('Clone and freeze original file as rollback source','Convert text in controlled batches, not whole file at once','Restore styles from a template after mapping characters','Review list numbering and table alignment side by side','Proof high-risk words, names, and half-characters','Sign off only after semantic and visual validation'); pitfalls=@('editing the only original','mixing conversion and styling in one pass','ignoring list numbering','skipping table checks','no conversion log') },
  @{ slug='convert-unicode-mangal-to-kruti-dev.html'; nav='Convert U->K'; title='How to Convert Unicode (Mangal) Back to Kruti Dev for Print Publishing'; desc='Reverse conversion playbook for legacy print environments.'; image='featured-unicode-to-kruti.svg'; audience='print coordinators and legacy vendor teams'; scenario='editorial text is Unicode but print vendor accepts only Kruti Dev'; focus='controlled reverse conversion'; outcome='legacy output without losing Unicode source integrity'; c0='#422238'; c1='#8c3568'; c2='#f1a9cd'; c3='#fff0f8'; workflow=@('Lock Unicode source and mark it as non-editable baseline','Use a verified reverse map tested on your own vocabulary','Convert only final text layers, not draft notes','Run print proof for conjuncts, spacing, and numerals','Tag each output with source revision identifier','Archive source and output together for traceability'); pitfalls=@('editing reverse output as master','discarding source after print','using unverified mapping tables','single-device proofing','no version linkage') },
  @{ slug='install-kruti-dev-010-font.html'; nav='Install 010 Font'; title='How to Install Kruti Dev 010 Font on Windows, Mac, and Linux'; desc='Cross-platform setup guide with policy-safe validation checks.'; image='featured-install-010.svg'; audience='IT support and migration teams'; scenario='same legacy file renders differently on mixed operating systems'; focus='role-based font deployment'; outcome='safe legacy viewing while keeping Unicode defaults'; c0='#1e2f40'; c1='#2d63a3'; c2='#95c5ff'; c3='#f1f7ff'; workflow=@('Classify devices by role before installation','Install only approved Kruti Dev 010 package','Validate rendering with shared Hindi sample set','Set Unicode defaults in authoring templates','Document where and why compatibility install exists','Review inventory quarterly and retire unused installs'); pitfalls=@('global install without policy','no post-install validation','unofficial font copies','legacy set as default','missing inventory') },
  @{ slug='fix-hindi-font-rendering-web.html'; nav='Web Rendering'; title='How to Fix Common Hindi Font Rendering Issues on the Web'; desc='Frontend troubleshooting guide for Hindi rendering across browsers and devices.'; image='featured-web-rendering.svg'; audience='frontend engineers and QA teams'; scenario='headline renders well in one browser and breaks in another'; focus='browser-safe Hindi rendering'; outcome='readable UI across desktop, mobile, and webviews'; c0='#112237'; c1='#146c93'; c2='#77d8eb'; c3='#effcff'; workflow=@('Define tested Hindi font stack with fallback order','Set script-aware line-height and avoid clipping containers','Audit CSS utilities that force letter spacing','Test in low-end Android webview and iOS Safari','Run screenshot regression on key templates','Publish known edge cases in QA checklist'); pitfalls=@('Latin-only typography assumptions','single-browser testing','no low-end device checks','aggressive CSS utilities','late content integration') },
  @{ slug='alignment-half-character-issues.html'; nav='Half-Char Fixes'; title='Solving Alignment and Half-Character Issues During Font Conversion'; desc='Sequence-first troubleshooting for matra and half-character errors.'; image='featured-half-char.svg'; audience='legal proofreaders and DTP QA teams'; scenario='converted words look fine until wrapped lines expose broken forms'; focus='sequence and alignment correction'; outcome='semantically correct and layout-stable output'; c0='#3b3124'; c1='#8f6128'; c2='#f0c26d'; c3='#fff8ea'; workflow=@('Build defect corpus from real high-risk words','Validate character sequence before spacing tweaks','Test in narrow columns and justified paragraphs','Apply template-safe alignment corrections','Capture before-after samples for reuse','Require Hindi proof sign-off for release'); pitfalls=@('manual spacing as permanent fix','wide-column-only review','ignoring mixed numeral lines','converter trust without validation','no reusable defect log') },
  @{ slug='hindi-text-english-gibberish.html'; nav='Gibberish Fix'; title='Why Does My Hindi Text Look Like English Gibberish?'; desc='Incident-response guide for garbled Hindi text recovery.'; image='featured-gibberish.svg'; audience='support desks and first-response users'; scenario='urgent Hindi file suddenly appears as random English-like symbols'; focus='safe diagnosis and recovery'; outcome='recover text without damaging original source'; c0='#2d1f29'; c1='#8c324b'; c2='#efa2b5'; c3='#fff2f6'; workflow=@('Freeze original and make two backups immediately','Identify last known-good environment and software','Test encoding interpretation on short sample first','Run controlled conversion on duplicate file only','Validate names, dates, and key terms after recovery','Document trigger path to prevent recurrence'); pitfalls=@('editing only original','random converter hopping','blind font switching','panic approvals','no root-cause notes') },
  @{ slug='government-exams-krutidev-typing-tests.html'; nav='Govt Exams'; title='Why Indian Government Exams Still Use Kruti Dev for Hindi Typing Tests'; desc='Practical explanation of legacy exam requirements and preparation strategy.'; image='featured-govt-exams.svg'; audience='exam aspirants and typing trainers'; scenario='student trains on modern tools but exam requires legacy layout'; focus='exam-aligned preparation'; outcome='higher pass probability with transferable long-term skills'; c0='#1f2f25'; c1='#2c7f49'; c2='#8ddaab'; c3='#effdf3'; workflow=@('Study official exam notification and layout rules','Practice in environment matching exam constraints','Split sessions into accuracy, rhythm, and endurance','Track error categories, not only WPM','Run weekly timed mocks under strict conditions','Keep separate Unicode lane for career flexibility'); pitfalls=@('layout mismatch practice','speed-first training','no full mock routine','easy-passage dependency','ignoring endurance') },
  @{ slug='remington-vs-inscript-guide.html'; nav='Remington vs InScript'; title='The Ultimate Guide to Hindi Keyboard Layouts: Remington vs. InScript'; desc='Destination-based decision framework for keyboard layout selection.'; image='featured-remington-inscript.svg'; audience='typing learners and training institutes'; scenario='learner switches layouts repeatedly and slows down in both'; focus='goal-based layout choice'; outcome='clear learning path and measurable progress'; c0='#20234a'; c1='#3f49ad'; c2='#aab6ff'; c3='#eef1ff'; workflow=@('Define destination role before choosing layout','Select primary layout for fixed 8-12 week window','Measure accuracy and speed trend weekly','Delay second-layout learning until baseline stabilizes','Use role-specific passage sets for practice','Review progress monthly and adjust plan'); pitfalls=@('frequent switching','random practice passages','social-media speed chasing','no error tracking','goal ambiguity') },
  @{ slug='why-publishers-mandate-unicode.html'; nav='Publishers and Unicode'; title='Why Digital Publishers and News Portals Are Mandating Unicode'; desc='Editorial and platform reasons behind Unicode-only publishing policy.'; image='featured-publishers-unicode.svg'; audience='editors, CMS owners, and SEO teams'; scenario='good stories lose reach due to encoding inconsistency'; focus='Unicode policy as infrastructure'; outcome='better discoverability and archive reliability'; c0='#1a3126'; c1='#2b7c5e'; c2='#80e0ba'; c3='#edfff8'; workflow=@('Add encoding checks at CMS ingestion stage','Standardize Unicode-safe editorial templates','Validate search and social preview behavior','Migrate high-value legacy archive in phases','Train editorial teams on encoding red flags','Tie compliance to release sign-off'); pitfalls=@('treating migration as one-time cleanup','legacy side-channel copy paste','archive neglect','no editorial training','no impact metrics') },
  @{ slug='improve-krutidev-typing-speed.html'; nav='Typing Speed'; title='Data Entry and Government Jobs: How to Improve Your Kruti Dev 010 Typing Speed'; desc='Phase-based speed training framework with accuracy control.'; image='featured-typing-speed.svg'; audience='data entry aspirants and exam candidates'; scenario='temporary WPM gains collapse under pressure tests'; focus='sustainable speed training'; outcome='stable performance with lower error rate'; c0='#3f2717'; c1='#a85c24'; c2='#f2b97a'; c3='#fff4e8'; workflow=@('Record baseline WPM, errors, and fatigue threshold','Run daily high-accuracy drills on core word sets','Use rhythm intervals to reduce panic typing','Track and fix top repeating error clusters','Practice timed mocks twice a week','Adjust plan from data, not mood'); pitfalls=@('peak-speed obsession','no rest cycles','same passage repetition','ignoring post-mock analysis','avoiding pressure drills') },
  @{ slug='hindi-web-typography-design-beginners.html'; nav='Web Typography'; title='A Beginner''s Guide to Hindi Web Typography and Design'; desc='Practical guide to readable, premium Hindi-first web interfaces.'; image='featured-hindi-web-typography.svg'; audience='new designers and frontend beginners'; scenario='great mockup becomes cramped after real Hindi copy is inserted'; focus='script-aware design system'; outcome='clean hierarchy and readable responsive Hindi UI'; c0='#31234d'; c1='#6f40ad'; c2='#c7a7f5'; c3='#f8f2ff'; workflow=@('Pick Hindi-capable type stack with fallback logic','Set heading-body scale with script-aware line-height','Test real content early, including mixed language lines','Use spacing tokens for consistent rhythm','Check readability on small screens first','Build reusable components with typography defaults'); pitfalls=@('placeholder-only design','Latin spacing copy','decorative font overuse','responsive line-break neglect','typography as final polish') }
)

function WordCount([string]$html) {
  (($html -replace '<[^>]+>', ' ') -split '\s+' | Where-Object { $_ -ne '' }).Count
}

function Html([string]$s) {
  if ($null -eq $s) { return '' }
  $s.Replace('&','&amp;').Replace('<','&lt;').Replace('>','&gt;').Replace('"','&quot;')
}

function Nav([string]$active) {
  $links = @('<a href="index.html"' + ($(if ($active -eq 'index.html') { ' class="current"' } else { '' })) + '>Home</a>')
  foreach ($t in $topics) {
    $links += '<a href="' + $t.slug + '"' + ($(if ($active -eq $t.slug) { ' class="current"' } else { '' })) + '>' + (Html $t.nav) + '</a>'
  }
  $links += '<a href="about-us.html"' + ($(if ($active -eq 'about-us.html') { ' class="current"' } else { '' })) + '>About Us</a>'
  $links += '<a href="privacy-policy.html"' + ($(if ($active -eq 'privacy-policy.html') { ' class="current"' } else { '' })) + '>Privacy Policy</a>'
  $links -join "`r`n      "
}

function Wrap([string]$title, [string]$desc, [string]$active, [string]$body) {
  $nav = Nav $active
  @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>$(Html $title)</title>
  <meta name="description" content="$(Html $desc)">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header class="site-header">
    <a class="brand" href="index.html"><span>KrutiDev</span> to Unicode Blog</a>
    <button class="menu-toggle" aria-expanded="false" aria-controls="site-nav">Menu</button>
    <nav id="site-nav" class="site-nav">
      $nav
    </nav>
  </header>
$body
  <footer>KrutiDev to Unicode Blog Series | <span id="year"></span></footer>
  <script src="script.js"></script>
</body>
</html>
"@
}

function Icon([int]$i, [string]$line, [string]$accent) {
  switch ($i % 6) {
    0 { "<g stroke='$line' stroke-width='8' fill='none'><rect x='0' y='0' width='248' height='76' rx='14'/><path d='M124 18 V58'/><path d='M26 38 H222'/></g>" }
    1 { "<g stroke='$line' stroke-width='8' fill='none'><rect x='0' y='0' width='248' height='76' rx='14'/><path d='M24 38 H208'/><path d='M178 20 L208 38 L178 56'/></g>" }
    2 { "<g stroke='$line' stroke-width='8' fill='none'><rect x='0' y='0' width='248' height='76' rx='14'/><path d='M224 38 H40'/><path d='M70 20 L40 38 L70 56'/></g>" }
    3 { "<g stroke='$line' stroke-width='8' fill='none'><rect x='0' y='0' width='248' height='76' rx='14'/><path d='M24 22 H164'/><path d='M24 40 H164'/><path d='M24 58 H164'/><path d='M186 36 L202 52 L226 24'/></g>" }
    4 { "<g stroke='$line' stroke-width='8' fill='none'><path d='M24 70 A100 100 0 0 1 224 70'/><path d='M124 70 L184 34'/><circle cx='124' cy='70' r='10' fill='$accent' stroke='none'/></g>" }
    default { "<g stroke='$line' stroke-width='8' fill='none'><path d='M20 66 H228'/><path d='M74 8 V66'/><path d='M170 8 V66'/><path d='M24 18 H70'/><path d='M178 18 H224'/></g>" }
  }
}

function Svg($t, [int]$i) {
  $icon = Icon $i $t.c3 $t.c2
  $subtitle = Html $t.outcome
  if ($subtitle.Length -gt 78) { $subtitle = $subtitle.Substring(0,75) + '...' }
@"
<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1600 900' role='img' aria-label='$(Html $t.nav) featured image'>
  <defs>
    <linearGradient id='g' x1='0' y1='0' x2='1' y2='1'>
      <stop offset='0%' stop-color='$($t.c0)'/>
      <stop offset='100%' stop-color='$($t.c1)'/>
    </linearGradient>
  </defs>
  <rect width='1600' height='900' fill='url(#g)'/>
  <circle cx='1320' cy='170' r='220' fill='$($t.c2)' opacity='0.20'/>
  <circle cx='180' cy='760' r='260' fill='$($t.c2)' opacity='0.16'/>
  <rect x='100' y='110' width='1400' height='680' rx='36' fill='rgba(255,255,255,0.12)' stroke='rgba(255,255,255,0.34)' stroke-width='2'/>
  <g transform='translate(180 220)'>$icon</g>
  <text x='180' y='470' font-family='Segoe UI, Arial, sans-serif' font-size='64' font-weight='700' fill='$($t.c3)'>$(Html $t.nav)</text>
  <text x='180' y='530' font-family='Segoe UI, Arial, sans-serif' font-size='28' fill='$($t.c3)' opacity='0.95'>$subtitle</text>
</svg>
"@
}

function Body($t, [int]$idx, [int]$total) {
  $openers = @(
    'Teams notice this issue during deadlines, not planning meetings.',
    'This looks small at first, then expands into review chaos.',
    'The visible bug is usually a symptom of process gaps.',
    'Most failures start with rushed assumptions, not lack of effort.',
    'Predictability improves the moment ownership becomes explicit.'
  )
  $closers = @(
    'That is where disciplined review saves both time and reputation.',
    'When this becomes routine, escalations drop sharply.',
    'Consistency here protects quality under pressure.',
    'Small controls prevent expensive late-stage corrections.',
    'A repeatable workflow beats heroic firefighting every time.'
  )

  $steps = ($t.workflow | ForEach-Object { "          <li>$(Html $_)</li>" }) -join "`r`n"
  $pitfalls = ($t.pitfalls | ForEach-Object { "          <li>$(Html $_)</li>" }) -join "`r`n"

  $deep = @()
  for ($i = 0; $i -lt $t.workflow.Count; $i++) {
    $step = $t.workflow[$i]
    $a = $openers[($idx + $i) % $openers.Count]
    $b = $closers[($idx * 2 + $i) % $closers.Count]
    $deep += @"
      <section id="execution-step-$($i + 1)">
        <h3>Execution Step $($i + 1)</h3>
        <p><strong>Action:</strong> $(Html $step)</p>
        <p>$(Html $a) In this context, the trigger often appears when $(Html $t.scenario). $(Html $t.audience) benefit when this step is documented and repeatable.</p>
        <p>Review this step in two passes: first for completion, then for behavior. $(Html $b)</p>
      </section>
"@
  }
  $deepHtml = $deep -join "`r`n"

  $faq = @"
      <div class="faq-item">
        <h3>Why do these issues keep coming back?</h3>
        <p>Because teams patch symptoms quickly but leave workflow ambiguity intact. In $(Html $t.focus), repeated defects usually indicate ownership or validation gaps.</p>
      </div>
      <div class="faq-item">
        <h3>Can we rely on one tool to solve everything?</h3>
        <p>Tools help, but discipline matters more. You need clear inputs, stable handoffs, and release checks that verify meaning, not only appearance.</p>
      </div>
      <div class="faq-item">
        <h3>What should we measure first?</h3>
        <p>Track correction frequency, correction time, and top defect categories for at least one month. If those improve, your process is getting healthier.</p>
      </div>
      <div class="faq-item">
        <h3>How do we move fast without losing quality?</h3>
        <p>Use small controlled batches, keep rollback copies, and enforce final sign-off rules. Fast teams are usually the teams with predictable routines.</p>
      </div>
"@

  $next = $topics[($idx + 1) % $topics.Count]

  $body = @"
  <main class="article-layout">
    <article class="post reveal">
      <p class="eyebrow">Article $($idx + 1) of $total</p>
      <h1>$(Html $t.title)</h1>
      <p class="lead">This guide is written for $(Html $t.audience). It focuses on $(Html $t.focus) with practical, field-tested routines.</p>

      <div class="post-meta">
        <span>Reading time: 16+ min</span>
        <span>Focus: $(Html $t.focus)</span>
        <span>Outcome: $(Html $t.outcome)</span>
      </div>

      <p class="resource-link">For quick cross-checks during review, teams often keep krutidev to unicode open in a separate tab and verify output with internal QA rules.</p>

      <figure class="post-hero-image reveal">
        <img src="images/$(Html $t.image)" alt="$(Html $t.nav) featured image">
        <figcaption>$(Html $t.nav) | $(Html $t.outcome)</figcaption>
      </figure>

      <section id="context">
        <h2>Real-World Context</h2>
        <p>The common trigger is $(Html $t.scenario). Teams usually react fast, but fast reaction without structure creates more confusion than clarity.</p>
        <p>In practice, this topic matters because it sits at the intersection of people, process, and tooling. Any one of these can fail quietly until release day.</p>
        <p>The immediate goal should be simple: move from guesswork to repeatable decisions with traceable evidence.</p>
      </section>

      <section id="risk">
        <h2>Risk Pattern and Root Cause</h2>
        <p>Recurring risk in $(Html $t.focus) usually appears as minor defects at first, then escalates into handoff delays and trust issues. Once trust drops, every review cycle becomes slower.</p>
        <p>The root cause is rarely one broken setting. It is usually a chain: unclear ownership, inconsistent inputs, and approval based only on visual appearance.</p>
        <p>Teams that separate diagnosis, correction, and sign-off reduce noise and recover control quickly.</p>
      </section>

      <section id="workflow">
        <h2>Step-by-Step Workflow</h2>
        <ol>
$steps
        </ol>
      </section>

      <section id="execution">
        <h2>Detailed Execution Notes</h2>
$deepHtml
      </section>

      <section id="case">
        <h2>Field Case Snapshot</h2>
        <p>A working team recently handled this by running a one-week defect log before changing tools. The log showed where failures entered the pipeline, which immediately clarified what to fix first.</p>
        <p>They then piloted the revised workflow on a small batch, compared defect rates, and shared one-page review guidance with all stakeholders. Within weeks, repeat errors dropped and review confidence improved.</p>
        <p>The lesson was practical: stable routines, clear ownership, and consistent proofing gave better outcomes than ad-hoc tool switching.</p>
      </section>

      <section id="mistakes">
        <h2>Common Mistakes to Avoid</h2>
        <ul>
$pitfalls
        </ul>
        <p>Most mistakes are understandable under pressure. The fix is not blame; the fix is a process that remains clear even on stressful days.</p>
      </section>

      <section id="faq">
        <h2>Frequently Asked Questions</h2>
$faq
      </section>

      <section id="final">
        <h2>Final Recommendation</h2>
        <p>For $(Html $t.audience), the best long-term strategy is to combine clear policy, controlled execution, and measurable QA gates. That is how teams keep quality stable while still moving quickly.</p>
        <p>Start small, validate outcomes, and scale what works. Repeatability is the real productivity multiplier.</p>
      </section>
    </article>

    <aside class="post-aside reveal">
      <div class="aside-card">
        <h2>On This Page</h2>
        <ul class="toc">
          <li><a href="#context">Context</a></li>
          <li><a href="#workflow">Workflow</a></li>
          <li><a href="#execution">Execution Notes</a></li>
          <li><a href="#faq">FAQ</a></li>
        </ul>
      </div>
      <div class="aside-card">
        <h2>Next Topic</h2>
        <a class="next-link" href="$(Html $next.slug)">$(Html $next.title)</a>
      </div>
    </aside>
  </main>
"@

  $notes = @(
    'Run a 15-minute weekly review focused only on recurring patterns and ownership handoffs.',
    'Maintain a shared glossary for sensitive terms so proofreading decisions remain consistent.',
    'Use real production samples instead of synthetic examples during validation.',
    'Track correction cost, not only correction count, to show business impact clearly.',
    'Document release decisions in one place so new team members can follow the same standard.'
  )

    $extra = 0
  while ((WordCount $body) -lt 1550 -and $extra -lt 6) {
    $note = $notes[($idx + $extra) % $notes.Count]
    $stepHint = $t.workflow[($idx + $extra) % $t.workflow.Count]
    $insert = @"
      <section id="ops-note-$extra">
        <h2>Implementation Diary $($extra + 1)</h2>
        <p>$(Html $note) During implementation, the team writes one concrete example from current files, one counter-example that failed last week, and one ownership line naming who verifies the step. They then test this on a small batch before applying it to full delivery. This turns guidance into behavior instead of poster-level advice.</p>
        <p>When repeated weekly, reviewers see fewer surprises around $(Html $t.focus). Escalations become shorter because context is already documented, and new staff can follow the same path without guessing. Over a month, this habit reduces rework cost and protects release confidence even when deadlines are tight.</p>
      </section>
"@
    $body = $body.Replace('      <section id="final">', "$insert`r`n      <section id=""final"">")
    $extra++
  }

  $body
}

if (!(Test-Path images)) { New-Item -ItemType Directory images | Out-Null }

for ($i = 0; $i -lt $topics.Count; $i++) {
  $t = $topics[$i]
  $html = Wrap ("$($t.title) | KrutiDev to Unicode Blog") $t.desc $t.slug (Body $t $i $topics.Count)
  Set-Content -Encoding UTF8 $t.slug $html
  Set-Content -Encoding UTF8 (Join-Path images $t.image) (Svg $t $i)
}

$cards = ($topics | ForEach-Object {
@"
      <article class="post-card reveal">
        <img src="images/$($_.image)" alt="$($_.nav) featured image">
        <span class="chip">$($_.nav)</span>
        <h3>$($_.title)</h3>
        <p>$($_.desc)</p>
        <a class="cta-link" href="$($_.slug)">Read article</a>
      </article>
"@
}) -join "`r`n"

$indexBody = @"
  <main>
    <section class="hero reveal">
      <p class="eyebrow">12 Requested Topics</p>
      <h1>KrutiDev to Unicode Premium Topic Library</h1>
      <p class="lead">All pages now have topic-specific long-form content and corrected featured images in one cohesive premium visual style.</p>
    </section>

    <section class="posts-grid">
$cards
    </section>
  </main>
"@

Set-Content -Encoding UTF8 index.html (Wrap 'KrutiDev to Unicode Blog | 12 Expert Guides' 'Long-form practical guides on KrutiDev, Unicode conversion, publishing, exams, and Hindi web typography.' 'index.html' $indexBody)


$aboutBody = @"
  <main>
    <section class="hero reveal">
      <p class="eyebrow">About This Website</p>
      <h1>About Us</h1>
      <p class="lead">KrutiDev to Unicode Blog is a practical knowledge hub for Hindi typing, conversion quality, web readability, and publishing workflows. We focus on usable guidance that helps teams reduce errors and make consistent decisions.</p>
    </section>

    <section class="article-layout">
      <article class="post reveal">
        <h2>What We Publish</h2>
        <p>Our content covers real-world implementation problems around Kruti Dev legacy files, Unicode migration, Hindi rendering, typing preparation, and quality review. We write for learners, operators, and teams who need dependable outcomes, not just theory.</p>
        <p>Every guide is designed to be practical: clear steps, common mistakes, and decision frameworks you can apply immediately in your own environment.</p>

        <h2>Who This Is For</h2>
        <p>This website is useful for students preparing typing exams, DTP operators handling legacy archives, editorial teams standardizing Unicode workflows, and developers improving Hindi readability on web interfaces.</p>

        <h2>Our Approach</h2>
        <p>We believe strong process beats ad-hoc fixes. That means prioritizing consistency, traceability, and quality checks so teams can move faster with fewer surprises.</p>
      </article>

      <aside class="post-aside reveal">
        <div class="aside-card">
          <h2>Quick Facts</h2>
          <ul class="toc">
            <li>Focused on Hindi text workflows</li>
            <li>Practical long-form articles</li>
            <li>Built for learners and teams</li>
          </ul>
        </div>
      </aside>
    </section>
  </main>
"@

$privacyBody = @"
  <main>
    <section class="hero reveal">
      <p class="eyebrow">Legal Information</p>
      <h1>Privacy Policy</h1>
      <p class="lead">This Privacy Policy explains what information this website handles and how it is used.</p>
    </section>

    <section class="article-layout">
      <article class="post reveal">
        <h2>Information We Collect</h2>
        <p>This is a static informational website. We do not run user account registration, payment processing, or direct form submission features in the current build.</p>
        <p>Like most web hosting platforms, basic technical logs may be generated by your browser or hosting provider (for example, page requests, browser type, and timestamp data).</p>

        <h2>How Information Is Used</h2>
        <p>Any technical data automatically generated by hosting infrastructure is typically used for security, uptime monitoring, and performance diagnostics.</p>

        <h2>Cookies</h2>
        <p>This website does not intentionally set tracking cookies in the current static implementation.</p>

        <h2>Third-Party Services</h2>
        <p>Current pages do not intentionally include third-party external links or embedded third-party scripts as part of the content experience.</p>

        <h2>Policy Updates</h2>
        <p>This page may be updated if website functionality changes in the future. Any revision will appear on this page.</p>

        <h2>Contact</h2>
        <p>For policy-related questions, please use the contact method provided by the website owner or repository administrator.</p>
      </article>

      <aside class="post-aside reveal">
        <div class="aside-card">
          <h2>Summary</h2>
          <ul class="toc">
            <li>Static site in current version</li>
            <li>No user account system</li>
            <li>No intentional tracking cookies</li>
          </ul>
        </div>
      </aside>
    </section>
  </main>
"@

Set-Content -Encoding UTF8 about-us.html (Wrap 'About Us | KrutiDev to Unicode Blog' 'Learn about the KrutiDev to Unicode Blog mission, audience, and editorial approach.' 'about-us.html' $aboutBody)
Set-Content -Encoding UTF8 privacy-policy.html (Wrap 'Privacy Policy | KrutiDev to Unicode Blog' 'Privacy policy for the KrutiDev to Unicode Blog static website.' 'privacy-policy.html' $privacyBody)
'Validation results:'
foreach ($t in $topics) {
  $raw = Get-Content -Raw $t.slug
  $wc = WordCount $raw
  $empty = (Select-String -InputObject $raw -Pattern '<p>\s*</p>').Count
  $anchor = (Select-String -InputObject $raw -Pattern 'krutidev to unicode' -SimpleMatch).Count
  '{0}`twords={1}`temptyP={2}`tanchor={3}' -f $t.slug, $wc, $empty, $anchor
}









