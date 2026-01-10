Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869F1F4176
	for <spacemit@lists.linux.dev>; Sat, 10 Jan 2026 05:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022391; cv=none; b=NJO66lAYGia3cBRX4/X6TB9UpVZa3lHSOtptIBTXNhyBhTrSPkxeAtFhQN22rNJNEvQAh28jhuUtq0rqJZZrUZJ/5Z4IOvZCWO27X6Id8eScyrzhTNVCxkRXKWsGTjQTWQdNDds2rDWV/zVs9gYGG8ewxQVtkwyg+saUXJcFHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022391; c=relaxed/simple;
	bh=S1jisF6ftVT3rCNF0GDuik15Q/hcWo5k5Yu1I9kYLtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNxzXRm03S/oaqaJnGcbOuPQ/8lfukVGWmTqJ4ZQAd3OkfsDWMj6N2nk6wwhLpgCWrTgp1Xax7MAfJRFSyw6V09RQRbdCZqeAnf3U0Ol1lKlW/GVq7oxneIgduF/0boOn7R9C6nLXAImle2cOZ8052x4meareAS0bxSbpAMdjsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=GhouhuWz; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="GhouhuWz"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso2973662a12.2
        for <spacemit@lists.linux.dev>; Fri, 09 Jan 2026 21:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022389; x=1768627189; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmyABXvs1SN8VuCBpy/0tab2Fs0I2RX3eOqS1zJrtK4=;
        b=GhouhuWzItoXhiULr3BZ7bLreVm4B91m4fWpVVfHgBAB7ROjfcAWELYFrBskOtsip3
         SutvEXUvZyJmJUBi1Ye2OMgXyxPdynVlRvrPQD6I+3BG9BMh/IsNctat74nhz8qVxtsM
         Hzub/tnho2bSAkEkzczkxz5UQJ+PWPloWVVakal/zzOpU8DHICS7fY9p1b9aoIBbt/0T
         wBd1cywzFAUDQJProbodu3eLasDyaZZw28LwPjnnqO8s0COCBhYekSQgVpTe75PDAs7z
         kDyTPTwg755RDo0E5hXDssnvQYzC/j/AY971yd0lVMaKIKT5g4+PVUBOa9AoNuqi/0UO
         unUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022389; x=1768627189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmyABXvs1SN8VuCBpy/0tab2Fs0I2RX3eOqS1zJrtK4=;
        b=ns1jepyS3KLWcYrqzhWAmt9vbyBHza6ssUkq7+7YnXDsK2OigQ3fhxv3rEH6xI8TJR
         QF2Z9gkcPvvIlpqXGjHsp2E2zjvBMSDmxc0VZoEwp2bysQGeSnk/VVVcSR6EQnUHY09J
         7bZHE01TAXhh9TYC329lwWoqkgIJvCCpzyVQKHwgQyF4o0+5tDJQK0LTJBM/v8ZB355N
         MxHnIIfrCLi7xXXvePqKVLF5wYjOp1HIwU217RK0jeTdy0ax1YJNayNEKVyeu/O/gSIz
         48rFMpRJU7lSs+JeeqoBofGQxmZ+Nqi90heaI77cG2rtIIqJc7ZDFDbl7Vw5akLtkCAJ
         KwwA==
X-Forwarded-Encrypted: i=1; AJvYcCXwx37+sN1y/0sy012PSV3nsr2Ll9SdCpTpg0mdvS68gOw9Tw475/8YoGqPR/lrFfw8klQ1DoSyXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/pxB3YRE4z+QHDQKInSz/jCEa9kIQQuoGLtq0N04ee5Vu0Jje
	Yv5IpsL6Tv0oU3nLqcZoOeULmhQzuWVdI/prxDHnAH6JRTCk7uEaE4wlnlnS53QtO2M=
X-Gm-Gg: AY/fxX44axgWru+HtfACRRCvKSuBxg1fnwkXXpK1gOYQcV3YRtnfjSWJOjOAvfZ7hPo
	cd95DKCNAU9J5TE2rE38N+pugkvewmUuRJUrUN8+HCYh4x8HAPqyZX9kDc5BHNb+gBGVy8KRBH2
	seaLROCx4wjKvu8+LJL2PkhWOZ2V3rfrKeCkFGIxbhuKPw+JQRnO2dgksYqohWF8qd0QcN8+hOu
	1lkILKhXEppxXAVXbqi6uDC4TZbVeiwmCJIkHpZWD+KR1RWz+H+P3EeBT6mcEPSFfJmjMBv0WlL
	1Dr0aZyGYypoBH4gXtvAPjdmHzZggyHwl2PsUI3R6D1UerR6dB3gzghUquagw1bo+t2x0WqtumG
	2eS+hnGcgKDospOONYYIS/uFTEWl6QZxl9UWLudBsj6LJehVz7PKl3XSbik0J+XNXY5CH4c0C8Y
	rowfKpKifAfrs60o3G0kTo6IGYlJdyR0ZPlVESjY/9Sln9IyUxm8f5SJoNORl6aP2c
X-Google-Smtp-Source: AGHT+IEPPeIUWgsSKZBo27LQFfXmf78KQe8uU+5vPpaDED03FOdBQAsZNe/tyTQTcMQjGVrGxwlkJg==
X-Received: by 2002:a17:902:cf06:b0:2a3:e7aa:dd6e with SMTP id d9443c01a7336-2a3ee48ac0fmr115216775ad.38.1768022389213;
        Fri, 09 Jan 2026 21:19:49 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:17 +0800
Subject: [PATCH v4 05/11] dt-bindings: riscv: spacemit: add K3 and Pico-ITX
 board bindings
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-k3-basic-dt-v4-5-d492f3a30ffa@riscstar.com>
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

Add DT binding documentation for the SpacemiT K3 SoC and the board Pico-ITX
which is a 2.5-inch single-board computer.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Adjust maintainers list in alphabetic order.
    Declare spacemit,k3-pico-itx as an enum, which can save future
     code change when adding new boards.
v3: No change.
v2: Use one-blank-space between name and email address.
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 9c49482002f7..b958b94a924d 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -7,6 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SpacemiT SoC-based boards
 
 maintainers:
+  - Guodong Xu <guodong@riscstar.com>
   - Yangyu Chen <cyy@cyyself.name>
   - Yixun Lan <dlan@gentoo.org>
 
@@ -26,6 +27,10 @@ properties:
               - xunlong,orangepi-r2s
               - xunlong,orangepi-rv2
           - const: spacemit,k1
+      - items:
+          - enum:
+              - spacemit,k3-pico-itx
+          - const: spacemit,k3
 
 additionalProperties: true
 

-- 
2.43.0

