Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7432DA762
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408861; cv=none; b=mgIFzr71eOwusgd5lm01bdZuUYaKX84GLxBQalpmfYmlaqIw9WIAtmE/Yul/ZHgqP0KjrF8t9LckCVpqy91ctKlul3HaKKAZSVsJHurRTBuvkGG5WiyqAbpuKTnPAQZgwV/8jojrUmDXShfRFBMsF9x4xZNi4rKc5joaQ0tf7Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408861; c=relaxed/simple;
	bh=5SA3J65WlN60QjZ8eAnYw9T14G42qcDvprvwz4v2MDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqWCmchlPSRmURJpLnnuN6ZPCRwAnwPlgMUOhBxN/8sseNhFXqrUEYXwWoM1xmo3WYasErIfB/tCKdYy6EvzXXHmXhUkIiWsw/jM14RLYFq62EosA4SDoBoVC9+BWyKF7dWqG3dG4DawYw3xzTnuyMNElkc7lqjhPQqxPFUVVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QTWUVWHV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QTWUVWHV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c21417781so3808054a91.3
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408859; x=1767013659; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGQTfjuLcO04tKg5qOE8aVGf71IAU9Gz/ZUJidQ1+vM=;
        b=QTWUVWHVcN8cSvDEJcEfXecPR+S0UJLIkIqboYm1lZqYjiqs30GDLrXWZ4u+WWqALu
         KK6+tEqYEGj1YovK+k1GLWoIdLJC6u5BcY+1BEgaZ0qyHS2xr9RPOFVtbSu2YfzO63lx
         5nTJbTzW+QceIAsddwb0uK/iWoV0RPh16RbDpa36SUOqHC7hN0ywOAhpisNU91K1P0fy
         UMdBQxLJHgsnfh2tS0JMSscU/1saV9oGnD2XNg+D7HvfvEVjz17HcCoi0RLh0/Iz5wKE
         wBeHgYztDf9mXVPyzn5NlS5Gpw+Tw9iiuMcH988FSWgmrXOIFP8xC31cYS8Tqm5cuKsI
         2zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408859; x=1767013659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGQTfjuLcO04tKg5qOE8aVGf71IAU9Gz/ZUJidQ1+vM=;
        b=LgRCxiiVy4lnSj9rKJWgfZNzuCWYVEr25QVDhpa2UmWxAP9W0kTuO5JVw8wvn6m1f8
         +lSfNp5uP/AD7Iy+F+xT3xqVW1czs+XkYoo8FmrwN8cadoUB530xnyQ6nwuPbK4PQVha
         Z4IYb7gAXuIBaV+/67FrGS1uL94rUjfx53rCKQDbUTUwX1sG9ix1VYo4dA8U0yx8Bg0g
         /PLRDGaZi/Rokox6W93bSYtSl/C8ylx2Mv5Gey6hGwLGmo9U9aixBTsHa0rU74uHJD5Q
         sqjozSpDRWCAv8vZ431CwTGeMcKe3uwsifg8DQJ7HJHZGVO1NVZkntZkgO6tfnCcgWy2
         JlJA==
X-Forwarded-Encrypted: i=1; AJvYcCVoqSYQs2waGUiSNJuB18lD50mrBkH258RZmJPbGjptJ94gSH0/f/JxZaq3Y/ttFFVQTuG8YMCEiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2SlRbxShgAFA7pov859cfhYzThjQ6UI/q4mPpX2ZudS+RcKj3
	J93yauWO8drCSrHx3cO+X6AV6t+vg/JPVACo2Ro2nmNuQdeIoiIrQHT9bzz6Ya74RdU=
X-Gm-Gg: AY/fxX5JPm/sxXO4XJ59fxGss/gWmcs1tpwdT8Obn+L1du5Z6tNraNzXVOCQfhX2opY
	GevA/ufCNhB4eEU5Y9vYALlsNX6czLvmOHCJhYX5UQU8ApbZK4MaHSUBfbWN24g6V+T34tFVA2p
	DusouY8Pskv3xErj09wWcr95JqOGp74odTchFEy4oQ+wxIwpGslMZ4vUT5zo2IZ9BtAdrVDfpO0
	kYhmzd0+1F3Xfczfo0sshF3Xq5Fm2IUrkckktTPD3YzVz3QYpWDVM9oDq7bkYbq7b0nixFkGZXd
	WAU0I4AozoKmsC40e/6Kdr+Zaii/fWoF5I/MGNuaB6yLAa+XrV/4IlgS1vDCr17hGYLyPBILv5S
	AAPVVr8kRwU9NsCRN/gdX+d604Cw/X+L1/84ajOSVzA/qPOl+CS7pM1CCGNSDcCeArNZGBz5zT+
	VbH41FFXjLq5jxYQ5NUBD2+ilmOtgYMbs=
X-Google-Smtp-Source: AGHT+IH9e82inTfTfBy9JIkcZ+jC/BVvaACK9Mh7FCCtZMLW3mXb8WEQ8z1KSPITq0+87R6HI/oygg==
X-Received: by 2002:a17:90b:1dc6:b0:343:b610:901c with SMTP id 98e67ed59e1d1-34e921bb683mr10198388a91.26.1766408859410;
        Mon, 22 Dec 2025 05:07:39 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:07:39 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:17 +0800
Subject: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
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

Add description of the single-letter "B" extennsion for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, "the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Hence add a schema check rule to enforce that B implies Zba, Zbb and Zbs.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 565cb2cbb49b552959392810a9b731b43346a594..385e1deb23996d294e7662693f1257f910a6e129 100644
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
@@ -735,6 +742,18 @@ properties:
         then:
           contains:
             const: f
+      # b comprises the following extensions
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
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0

