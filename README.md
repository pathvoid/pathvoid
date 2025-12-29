# Martin-Patrick Larouche  
### Building quiet tools in noisy systems  
**Privacy isn’t a feature. It’s a foundation.**

I design and build reliable, privacy-first systems with a strong focus on clarity, automation, and long-term maintainability.  
My work sits at the intersection of **software engineering**, **data integrity**, and **domain-specific AI**, with a strong emphasis on user trust, platform safety, and long-term system health.

I believe good systems should be:
- Transparent by design  
- Predictable in behavior  
- Respectful of user data  
- Quietly effective rather than attention-seeking  

---

## Flagship Project — NoBullFit

**NoBullFit** is a privacy-first health and fitness tracking platform that I actively design, build, and operate.

It allows users to track nutrition, recipes, activities, weight, and wellness data while maintaining **full ownership of their information**.  
Core features remain free, and data is never sold or exploited.

- Live platform: https://nobull.fit  
- Web application repository:  
  https://github.com/pathvoid/nobullfit  

**Key characteristics**
- Modern web architecture (React, TypeScript, Express, PostgreSQL)
- Server-side rendering for performance and reliability
- Full data export and deletion capabilities
- Clear separation between product logic and background processing
- Strong privacy and data minimization principles

---

## AI & Automation — NoBullFit Worker

To support platform quality and safety, NoBullFit includes a dedicated **AI background worker** responsible for automated verification and moderation.

- Worker repository:  
  https://github.com/pathvoid/nobullfit-worker  

**What it handles**
- AI-based content verification
- Text and image moderation
- Illegal content detection and automatic containment
- Controlled scheduling to avoid over-processing
- Human escalation only when necessary

**Design goals**
- Safety without surveillance
- Automation without overreach
- Clear auditability of decisions
- Independent operation from the main web application

---

## Domain-Specific AI — NoBullFit AI

**NoBullFit AI** is a custom-trained language model specialized in fitness, health, nutrition, and mathematical conversions.

Unlike general-purpose models, it is trained **from scratch** on domain-specific data, with fully automated data collection and resumable training.

- AI repository:  
  https://github.com/pathvoid/nobullfit-ai  

**Key characteristics**
- GPT-2–based transformer architecture
- Automated web data collection and synthetic data generation
- Domain-specific training for fitness, health, and nutrition use cases
- Built-in checkpointing with pause and resume support
- Local training with no dependency on external cloud services

**Purpose**
- Provide accurate, context-aware responses within the NoBullFit ecosystem
- Reduce reliance on generic AI models
- Maintain privacy and control over the full AI training lifecycle

---

## Core Principles

**Privacy-first, always**  
User data belongs to the user. Privacy is treated as infrastructure, not a premium feature.

**Automation with accountability**  
AI is used to reduce manual workload, not to obscure decisions.

**Systems over shortcuts**  
I prioritize architectures that scale in clarity before they scale in size.

**Professional seriousness**  
I build tools meant to be maintained, audited, and trusted over time.

---

## Technical Focus

- Backend & APIs (TypeScript, Python, PostgreSQL)
- Background workers & automation pipelines
- Domain-specific AI and custom model training
- Content moderation and platform safety systems
- Data integrity, lifecycle management, and auditability
- Clean system boundaries and responsibility separation

---

## Current Direction

- Expanding domain-specific AI capabilities within NoBullFit
- Strengthening automated verification and safety tooling
- Improving long-term maintainability and observability
- Building sustainable, self-hostable, privacy-respecting systems
- Applying these principles across health, productivity, and internal tooling

---

If you’re reviewing this profile as a recruiter, collaborator, or engineer:  
what you see here reflects how I work in real systems - quietly, deliberately, and with intent.
