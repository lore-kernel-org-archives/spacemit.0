Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350434E26B
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892049; cv=none; b=VnCug0WCxa4browKf0a8a+r91aEPQJU9x+y6I/kRzXPsghiJF1Hdc5EHtmcAAYhO2gHEEAw1FPWTvaAX8GXLJVG71agbLAlvx/LTWqvITepLAZwYCQX0kGQd+BbE6r4b5Ig22RrfeAvhzupFL+sdp7zq252Jdp80DT9DskDJInQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892049; c=relaxed/simple;
	bh=WXHiNOHxNEkVgGMjQZWeXB9DxbyMRjTpNm9zjjrOvhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o87cB4vIFPIzZiJrJ8cF5HDkA8UTeGzW+7TWrTb8cUODfoX3ZnqWd92pJzTlFj+Rlqc38+Bcg20I5Jrbvk9aCX/WNKvMwx1a9YraBQFM8vYecgAqwjYfWxRohyUicS4uyxgarW64QgIDygKb285Z62AOkPTQLSHkArIDvs8M6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mkA3PLD5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mkA3PLD5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09d981507so21897015ad.1
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892045; x=1766496845; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7y/C6MB7UDZ9brxunSfG6djbfKn9Ck4w/Hk2KhvHZ4=;
        b=mkA3PLD52XveF9LaoWDousnIisDWwPL1IEDHpZSmwSGjI+7w+jSVhL1XYjHWuZ02Oz
         Dbpy4iey7Xj2n/bhBoEipQavAnjSvK2UBJh7fZqHIJ9RkklPkaLtpIoKW9PVYK6Wlttf
         NtPLGp58XOBfUfSHkYWhDhOQEFWXRZVH4Za/pxTmIzCbDuJsxKkgZ+LVR7u7EwX8p+FQ
         5rrgDf0OunoVddoTHMZRWcViLZrn13ldn8TEkVkElBZuS+2Zgey/qZ4nob5aH4rMVDHg
         86YCTqMJpYWcVcVhREGZNoRPP0Kx1Zav2jlkWduoLOHORnAUbyzTkFLkL8kdUfxFvNMk
         +NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892045; x=1766496845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t7y/C6MB7UDZ9brxunSfG6djbfKn9Ck4w/Hk2KhvHZ4=;
        b=YYuzYxYtYQ361ZtV3Wj6Kl0lsyL2VAJUX3EMNYqQt6gi95UwCkmsRtqeRKylB+WSeR
         7NzTwP8L6bdHShoxGHYeHhtrtj0BHI+JrMNCrjxOPgL0OPHgqPoOUz4ArgEEWXxo0CyV
         JJKDe6bLKcCFfsNpLhSDTpzgcMrXehGi3S+lPk03uhZKg8aZXUk/YTWD61ISnGpouLS8
         MaraY8lVkeRFHxIBKeJ5PedMiL/k0MVgySfdEnv+Wk9KQPyARnWRDg+s127X7HHOlvK9
         9iLxY9PtogjLtEOA4z2bOwfjRi4dlKxXCgPUOfLndDyum96hTceCeQTQGcz6sdLdDY2R
         +r1A==
X-Forwarded-Encrypted: i=1; AJvYcCXQYSXTaZi4VP8OQjaMhY59Aapv/RWDMx8R48q/cBttxhXX1XJqQ3XRfdGypCYJSeBQFhSdsMLy8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZe+O9+K3Lr/uV8xw+e8lNtdQgtDmZD46WkTerA7GYHoE9l5SO
	nqo0BpCeh/yEkfHR+IyYr5kjGkAIsB3eDF8NW9lzmH3LtmNXeYA3m4cvB2g6Xf0DhQo=
X-Gm-Gg: AY/fxX6xNfaT90ZoavF7n135CIUYJ8DB8i4GnHSZDaYbZNAVrx+pm0/qqFITyEX5NwL
	A0A62ukVYU5HdZ2s8wjFAAIMYCFhgsyYMa4SfmXKfgFWdROalHLPUgsQSpfRRrS9ZxFnpJpHR7q
	8zNca/5dACYHbcCK+c99UshPiNYRQCJT44xoDIE6z4mtKwld6F0rlPSbfC9YUSz+hVV4pww4i5I
	Gze+yhratFMrafwJLh5Uh/04t6YBqP/QwNpaPqTetGArCaWgj5ifqTXNLilSMo5I/4O3TCym5cC
	b2VFQDaGhNHjqjVzAEhinqWBS8Qbiio7DBxXuM3XJ3WKGOrtDDhJwTpZvWy8FUou6Q0ue+gMRZb
	i0tDfr3N/vrxgSODb4viHa1w1PXF1suVnwsUZEs7AyqS8p7ttQKjvJ0uOu4AEaFaF8nyDNkXPjG
	udtNhvQxGz2q7+8sFqBHoALIdEt0m7AZg=
X-Google-Smtp-Source: AGHT+IGlJuIYFFX4Kf4ETwvpERoBwiGUxzh2gcBhl1n1hPyzmW7Qi4XuHbuLS3V/KKQPD4rNe3NC7g==
X-Received: by 2002:a17:903:1a0e:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a0c92ea624mr100750335ad.7.1765892044589;
        Tue, 16 Dec 2025 05:34:04 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:00 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:30 +0800
Subject: [PATCH 6/8] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-6-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f768cd0cc59be6db02659a43fa31ce..003b0bc1539b621e39172a0565dfea1274cbc8b8 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -8,7 +8,8 @@ title: SpacemiT SoC-based boards
 
 maintainers:
   - Yangyu Chen <cyy@cyyself.name>
-  - Yixun Lan <dlan@gentoo.org>
+  - Yixun Lan   <dlan@gentoo.org>
+  - Guodong Xu  <guodong@riscstar.com>
 
 description:
   SpacemiT SoC-based boards
@@ -26,6 +27,9 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - const: spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0

