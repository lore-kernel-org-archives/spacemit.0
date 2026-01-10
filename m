Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B622E54D1
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022401; cv=none; b=NrPYRcMZpP7c9uqOECPShqlkPd8VJCCWrDHiacjSQnyw1RRhW0Jq6QvfKvSCV5BLamICijuz/VmxJzfjegcZRin1ds7oSF4rhk33pWfpMaZKGWlzKMFAqvm7a7ftQUw8R2qW4Y9fNqb3/skC7ROmiI+Jzm71LCc3Od3czevg4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022401; c=relaxed/simple;
	bh=3wbWbc1mTzrz6eXxKXT7Ky0hEK+v9voe9g90BQf/vrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8wqfGlMzP6XquxHMixlyn2FN0Eyg4kK8IOtsj1bhW9MAeb47uQbwZuo1vcj7WEvKmpjLyZfKuSkT2Lt4i7uhQiPOee2HtMIE5I785NjgZZkzOdoEcaDcvypRvMpd/gXXrRMDk56uQT8xu15ydURxXYpgr9a9/zv+teXQgSLzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=PR60pg/r; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="PR60pg/r"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a102494058so16511305ad.0
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022399; x=1768627199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgbhy2bR2/d0ajbeUdzL14ozIkLKVnJeuVGHx2O7OYs=;
        b=PR60pg/r6Wyo76JW5HzbiZIgyWUNDgjCZgLDSyZG0YlSQDfwEGoGmQRA9R1QzGfHe0
         OTtEbUWZ81lYg6ag+5jpun4ClGUcZ3ef5ZXkBHzq+ERK2Lelo9wyOG8K9yRvm51Y+F0X
         wT2GZlIZyM4paGNTWxvNPjy0fAjV8qhXv9s2N6vj0/w/dnrZYM7T2xzgV+pwVpXCUze0
         +ybS2Fm8HHLqIts2SEpR5+vpzNgLJvC8JIl4GXgWch2FsPAXCMXEjcs9OI/lv6T5lGW2
         xYRI0ZB2at+sfN6v+4EpF87GQDfWl8auVn0uJUFlnrjJysYlQSGhn0R3Tu0uqO56URJM
         tjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022399; x=1768627199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgbhy2bR2/d0ajbeUdzL14ozIkLKVnJeuVGHx2O7OYs=;
        b=j2za2BWesEH/9JKHDwn0X44ku7a5JbcCk4m6uUHeQzLbJnHHn4NnqmRzMH++WXJZOo
         hInuq+5VFGw5T/NG8lnUT8UFr0vl9dziwVYtGwhGPvzxsR+2ud7Smz6RRRb8v50TUGH/
         5A292hoSPxJcFhlZH5a0e8lntdh/UJI7sY0vAwC4/NETZxBkjHF42R9t01XB6csOWlYo
         iL2IMYdp1NC6Wn+xqtNq6TjlnPG4b/qke61hwnQlYzDa3TWvB7HS5XAOunONVP68lqYK
         YQGD4EueQJymbcENirSIeakMGxejSyzuEJclN1v7nFHcrSCq11YuyBi0T6qDTThVaNFK
         X+jw==
X-Forwarded-Encrypted: i=1; AJvYcCWsCscMxNEz/SALMjng5H6R0v/yEJjaAuBNW+DQsJhgTiHVxsJz8pbb9M9QWkyZPfmp7e91zAJH7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5i1Bw+VMWchf75vnhi+5n2qlSvUPOSYYPzwWqDeHaD0tp/WXh
	HIYdSmlkuvp/N1sXnkntymZwOw6xLpDoNPNptMBPy3/FfozANnw4aGfTH/yRnSHyAKc=
X-Gm-Gg: AY/fxX5pVpNumqPDr0918bCKJSyD12HSM4hCHKJPmV01zjgXMOhq1WOThkMeMluMeP9
	YSsmxRQFHihkvHB6Ep+JxWFBvWCkpTTlAG0fW6FHlsQXrswTW5ocgQyZJxXXjFEeqdswNvaNlNI
	EnM/auz43vo89Pgj66rT33DNM+az2V4V7eMAEGukDwpjwL+jWbBNA62/YgxS5bbBG6LRVYgwRFa
	sFwVxzVZyIYFkFf4Onu8I9pE56Gkhxh7N+ZsOObTO3HR++PClT2lCKcJce0H3pByTboTQLA1KKt
	+aXrT/YZZvnLtV2UYjMDruvSBfj5DLQf4GuaXotZPmD2Vk26YgWCdv30bj4HXPS+kZ3l0M5+92V
	O0mrZealqctZ5jfsTWUcfZvSTvVhlEPMTups+YfBAdQnGbfi1ryu7fTmXlMnEhYi9dylgDojxy+
	IK9ubLN1LN+LYTldKX3UfUlpVZQlJ0tf02+KNJjTzWgLF4WqlcEkuyCQ==
X-Google-Smtp-Source: AGHT+IGNuBpZhl78Zw5IbiS1grRE/HsJVf9xBHrMUUqcEcHDzEu/FhyxEhd8ywpJ3q/0ESFdRnbphg==
X-Received: by 2002:a17:902:e545:b0:298:639b:a64f with SMTP id d9443c01a7336-2a3edb0de06mr132346145ad.6.1768022398915;
        Fri, 09 Jan 2026 21:19:58 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:58 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:18 +0800
Subject: [PATCH v4 06/11] dt-bindings: riscv: Add B ISA extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
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
X-Mailer: b4 0.14.3

Add description of the single-letter B extension for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.

The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
unlike other single-letter extensions, B was ratified (Apr/2024) much
later than its component extensions Zba/Zbb/Zbs (Jun/2021).

When "b" is specified, zba/zbb/zbs must be present to ensure
backward compatibility with existing software and kernels that only
look for the explicit component strings.

When all three components zba/zbb/zbs are specified, "b" should also be
present. Making "b" mandatory when all three components are present.

Existing devicetrees with zba/zbb/zbs but without "b" will generate
warnings that can be fixed in follow-up patches.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Update the commit message to explain the retionale why B and
     Zba/Zbb/Zbs should all exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index b615083f2544..f671299ac819 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -109,6 +109,13 @@ properties:
             The standard C extension for compressed instructions, as ratified in
             the 20191213 version of the unprivileged ISA specification.
 
+        - const: b
+          description:
+            The standard B extension for bit manipulation instructions, as
+            ratified in the 20240411 version of the unprivileged ISA
+            specification. The B standard extension comprises instructions
+            provided by the Zba, Zbb, and Zbs extensions.
+
         - const: v
           description:
             The standard V extension for vector operations, as ratified
@@ -752,6 +759,30 @@ properties:
         then:
           contains:
             const: f
+      # B comprises Zba, Zbb, and Zbs
+      - if:
+          contains:
+            const: b
+        then:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+      # Zba, Zbb, Zbs together require B
+      - if:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+        then:
+          contains:
+            const: b
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0

