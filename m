Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF1228B3EC
	for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947517; cv=none; b=kUz4l5FMHyS1w31/ZBub6Lcidlc/R4mHJ1VcTxi0vPx1B/H6reOj9fx1iU2ICq9W4FqUnwgY/nBgG90hNCEJdiiCD4lyi81Z86DuL4ZVafESrrQHDf+7s1Mh/Ig8xuHLtloa8LR6hP8Qcbc8em6YkUaIqzHpFmTURRvlvW72OXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947517; c=relaxed/simple;
	bh=hMn6z2AZyzcbL/cGMK7HwRD4mhVABvJkOEyvUbzSheE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCVxU7fh8BWPr0EI83TL+gJnlyIZ9T1lslkNNcdcC5YvMpI5yuRfBGTCdKguuzZehlRDTjoGcmr6SSRZu0WCOKHltzuOHDZIlRkf6w+VJ8u5Wdwv1huMQ9rjFEv5Ts767OFbdvgFzKC8bsCSmRkYY5k8UjGKCWTIEvYNeOd3jPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IhCBUVZG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IhCBUVZG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a5851764e1so20477751cf.2
        for <spacemit@lists.linux.dev>; Thu, 26 Jun 2025 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947514; x=1751552314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=IhCBUVZGiWCxIsy6tCsKSfs9tqkXuscIvJN9o44H+PWjtQV3BkzTkTqktgDMf+l0wM
         9mwh4pBw/6EtDz+loOES0PETR88JFjo5uU9s9/ESQI7xk1k5x6HvKcGn/z9J9txXskLW
         MftTQM7Yh0qWgZA/8AdCDhSQa3RrfXeN7SnXZ5d198ZUpNTuJm3Q/pVTKpEDH5nSga/K
         y3ngk1TNFf3LDBOpTTFVhbV9V8pddNbpigqasTldmssU3CXyf868hBuR6ge8FIuNpKue
         slsxhDmoq+XoqWCYuCSHkcYwYS+QrCrMgwxLdCI/cV6vzO/gY3oXPzNNjHAE+hq0LN2Q
         JVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947514; x=1751552314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=KnedbHm7BmDhtFAIAjtadQJRuzpst5HANe39yu8QU2uIU09fwylIJcyWRDk5Ga+mtc
         UNqvcH+o5N5lFCdCiUML4BWR1/TtVgN2uiGNHk8VJbXpBDFdfYhDQw0juol96rwen/7q
         wdLaM++HggH5P5LJZZTpRKIqEpVrH20ygqxyl2dC2F98PEINiKlXp8AMWqwf0FjHl/QW
         +hz77iJ87jE5uNw7RwZjk85VidCwITibxPAy064z2g7+5Qfu5f8SlOmnW9F8USIUaj1X
         kmOJCZb5d6SddTcNaw3Ye3t+Qg3nsXwEqyx+9tQ0gP/fFjQ4bt5gEnYmUJq1gL3UcJiZ
         msYA==
X-Forwarded-Encrypted: i=1; AJvYcCW3KGES9hvV8e1rlxqvl1WszikAP8yloPEh5Ms9nKMPjeHz3mbnkKch6TeZIy1lTFzPj2fGkCtUsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXuYKYPhw630ICGuF7pgaBdL3oTRFoNLjild+sfnZDOYouq/Kq
	lggvTkh1Ih7uprZh1EN8phr2E/nX01CGExYTSCg7C/5ALZLCD2ol/SZc9Q+CUElYpkY=
X-Gm-Gg: ASbGncvCb0QnxOQfivt68s5YEDpOXkkD58ikiHFsAzT3BXVYevlHM+BR3zRZFUNycbW
	UJLaOMZ8zjZRS1YUSo/vkTKEhX9Qg2CAD6tnfA6z3aAw4uGmYipb3oJQBkkF1gQ15a8qKcJTOg5
	zugDVsFFph3leG5AgZrXuO+kAI7c4R8wDOVDtZ9pCSts1P4IOZq6g+0gUmLAFd6q193+E8W/KCk
	a6zxmAEFNblvbu3O5UGz67VRvqJ4a3N0VPaRuIz3ajNSc2MsFu74alKZaJRxm/Xqm9/DnfVIYi4
	L1nLDfunKXrFHdWeZ/Cll2Op1aSjjjd2czfRzhI+Hj3ncCrYkPbsxfQmNLHcVngpg3wq0Cnb/7P
	G9VBxMhYs1YhSxgkZFoJPJSWQpjwlBZuZhm4=
X-Google-Smtp-Source: AGHT+IEWxkse5hTkmeklkGnlPmhHsuowNr5lQuTqRpNLHHlNF9sUuGIos4wTOLkkzfZbR39s8zymFw==
X-Received: by 2002:a05:622a:1914:b0:4a6:c5ea:6fc with SMTP id d75a77b69052e-4a7c0857cf0mr107432031cf.42.1750947513647;
        Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:33 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 26 Jun 2025 09:18:20 -0500
Message-ID: <20250626141827.1140403-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2

