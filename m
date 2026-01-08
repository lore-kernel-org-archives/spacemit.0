Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B98466FFE
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875273; cv=none; b=pY6RmQuOsVyQWOBH9f1EBIjxmkjjeQXbCOlOS4sqjMUOHPDbw9DyByI8rsHLWZryt94Flf7OwVJszWtiQ0bhNCIdk6jLhr4eo5OZbYR/bjU3JDx2bubewEp0h1KTxOgMYY2XtDZ+H6uSOVcIb/DpaVIm5PUt2/WmM4lCJrYhoi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875273; c=relaxed/simple;
	bh=9i98spOttY2+pSY3C1YkNBPDmYrEvuZoRZJ/UHtvLAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avFStTeTscPt9gCaDUbllomFJsJxgzR4W4KeMew0OvmcjyDqx1YUvqG9VwPPz6s0tYwOxAFVrV0mz2uLKVFeql3SLa+EmmHQQcSBupLV0DgPieZvjZMXEYNql9xn6/suY8Ezco1hFz2E22ivvi87qudraklDLGXzTG5oStQly6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=RhjxTnLx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="RhjxTnLx"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-803474aaa8bso1049421b3a.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875271; x=1768480071; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF+6XfhiDaME4QgjDZFKmUqe8YthR175qEWdqlfUTBs=;
        b=RhjxTnLxrwg/MEbaoBsGr09egrwCJjC3wRvNPaQGJNujCYHTiWcl7Bj+SQyNjj4mYF
         2EvBpN3jT5ofBSXkiL+dJEgAv6CUDPceknQ48OKKP0HXmjIYh3ZSeEJmWwRXRxQKCz/J
         eOKz67g/1pqx5nOrbW/bIiw7MNTZ5yDRypyZuChzBdvn3qGHF+1ziaobmXAhrfCH6g9H
         JMsQYLCbBa1j0pRUGEwFGQqh8wwr+XX5pofQBPLSOar7rpMgiaYwpu2KxR3Py9TvCadT
         Ei+B4v78azLDekCB6a3MSLh7/56iXtFe8ZGXJd8MLyc0BrCOICI0Y6ht1lskbeNkRQ3R
         jIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875271; x=1768480071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VF+6XfhiDaME4QgjDZFKmUqe8YthR175qEWdqlfUTBs=;
        b=MVQ3LKJPvAqk7GAwQjrFoS2vnJtCs5qZOctUfOwFausXAwyJXoGKEEp5zU7EnAVcQD
         /CUD5fy79fNh8eqDwt3EJ7xeRRIFJlmNWQcONB4KanbSpyUwkH4mVwwRkv39OQkWMK9r
         1sjK+F5CziseSiB8n8X1rz8flFydXZCB79jZxzPx2aZdScpFekDnigi0JSxNEoFyTbUf
         T3ytni9WZTtclKHtwxS0jfuwUY44Kl5kD8xrtIJH/IrtznWrJp5ZR1c1AGXl7AFHbA03
         S8CCNQ6eqUsh/vz2vpKXJ3KY2ktU24jzAXkQpOaS3PeDjUOO9vuA9V5berKbFPc1+viK
         6Q7g==
X-Forwarded-Encrypted: i=1; AJvYcCUbWWJkBR0WyZZkDxKfOpuk1Zk35hPDV8UWpmVT+T6g4qG/lnWuV2U2ahCK0MjN3DeLbJUz07RVTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybpjdNoXqO99C3WeomnaxNpzE1YeiFwzKjPUjaJ4d9Bdpr3OQx
	oNW03dHqEJxrFUoWl7rYIOTjbQjuwMy9v7Qv9XT7ZNCB6/uIzIK8SYOdsHoT+PX3vc4=
X-Gm-Gg: AY/fxX6KZP0ss5X3k4WjtgDRw5V4BI4RiL7aQ7Y7QDRID4BItMf/bIYveCqaEErcfyc
	mMfZdHOjVp0K4Cn7yDV7M+gpbolVuU3R8PpTc2Je89sZ8B1mDzhZlrgylZvXwhNFXA8nYwZ4SxI
	lTOs9I9DhGlsRIIw87pDMNYuTBZOMUKG6pQIIBaZA5FZN4+U2jGUFs3e//g9mpHA1U/6akqvsdW
	s0jiD7OWIOizDTQ86jaORidKKAXjDbtMv7VHkGNJo1On78FhSPYH+THi9szIeR5ItBD8BLMJSp9
	R0ANEszEfAa8+PrFFgSLVuyUeRIyE6jJexOoacwmgxPpv319OVq5cCjgPDVlRwiyZ1hkg62GZsr
	jQYUP5wBI1xVHtAdUcTD+a+m5ooYi8uBjFIZleFxgkQKJCRA5stYZ9i50dinxude8fbrB/E4G9f
	0cLM2rwEiP8EX53LxRORAdGIskWAAL30A=
X-Google-Smtp-Source: AGHT+IEuqH9MIiC9H2NSi1ChnIIwHhuGoo28mnGGHSS2rHnq50vXKYnFjmfUIo4idAzSS1orpBUuTw==
X-Received: by 2002:a05:6a00:35ce:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-81b76274120mr5237100b3a.7.1767875271304;
        Thu, 08 Jan 2026 04:27:51 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:50 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:26:00 +0800
Subject: [PATCH v3 09/11] dt-bindings: riscv: Add Sha and its comprised
 extensions
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k3-basic-dt-v3-9-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add descriptions for the Sha extension and the seven extensions it
comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen.

Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
"rva23/rvb23 ratified") as a new profile-defined extension that captures
the full set of features that are mandated to be supported along with
the H extension.

Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
b1d806605f87 "Updated to ratified state").

The requirement status for Sha and its comprised extension in RISC-V
Profiles are:
 - Sha: Mandatory in RVA23S64
 - H: Optional in RVA22S64; Mandatory in RVA23S64
 - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
 - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
 - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
 - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Drop dependency check for Sha. Both Sha and the extensions it
     implies are allowed to co-exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 78b75ab0a473b60508f72fc30d4809a797a2c40a..839f48503f8246864495f7cda93a572b01351b0c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,57 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sha
+          description: |
+            The standard Sha extension for augmented hypervisor extension as
+            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
+            ("rva23/rvb23 ratified").
+
+            Sha captures the full set of features that are mandated to be
+            supported along with the H extension. Sha comprises the following
+            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
+            Shvstvecd, and Ssstateen.
+
+        - const: shcounterenw
+          description: |
+            The standard Shcounterenw extension for support writable enables
+            in hcounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: shgatpa
+          description: |
+            The standard Shgatpa extension indicates that for each supported
+            virtual memory scheme SvNN supported in satp, the corresponding
+            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
+            also be supported. It is ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shtvala
+          description: |
+            The standard Shtvala extension for htval be written with the
+            faulting guest physical address in all circumstances permitted by
+            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
+            commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvsatpa
+          description: |
+            The standard Shvsatpa extension for vsatp supporting all translation
+            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvala
+          description: |
+            The standard Shvstvala extension for vstval provides all needed
+            values as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
+        - const: shvstvecd
+          description: |
+            The standard Shvstvecd extension for vstvec supporting Direct mode,
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced
@@ -186,6 +237,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssstateen
+          description: |
+            The standard Ssstateen extension for supervisor-mode view of the
+            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
+            with commit b1d806605f87 ("Updated to ratified state.")
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as

-- 
2.43.0

