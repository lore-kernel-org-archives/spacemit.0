Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FB9211706
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571820; cv=none; b=Q38XJ7fW973ToYqD4VINpai9QJBsQMBmBjUB9w3liLAxZgSM+6sXy5yjc2fNm/KUL0Ostx+nMr5uyyGeprahi6SlJgAd8Q/22Iq4bxqbRQB+x0kYfJ6kNOo/0hwpJ0hXW8lrhVHhHfcTbdZXdyNphutR7gp/sTxqcym6mvvJAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571820; c=relaxed/simple;
	bh=dosS9pDdgnVcYrxQ6KebJvE9ghDY6SThkSzJfM3JnQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ob8alD+7KAOIyfL7atCn+EstixVCeH8r7x6k8cHbhnRhUBXpXfN3zXpdQNUwqi+YdSPsGYPkE9kwOgug00esjxVPf9UM6v6X1vZouWp8eSMt6YRBp9DbljfpEWdCW97y5DKYglGj5uZ6+71IHwPrZxO2ac1rE/PlE6flWQsT4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2Bj9cIoD; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2Bj9cIoD"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-430ccd45f19so50794725ab.1
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571817; x=1762176617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=2Bj9cIoDPWCCJ4YD4QKkp1T/fjoj7H9OO07zPablA3I7ll5Q3SlaVZslr8CvASrcwS
         HmsGdIiShi52J15IYKF6U+YfXJXpbT+sgJGW96fHSfDP7SLgZmWS2NfWpwHQFHnrZliR
         GJ2KbUi9zzTx3w55eQKCVK0R6nnyN/uCLGrnQgBG6iFks2iiBZ4C3I7cs6tL03BBzgfS
         MBKKZGrTWNaIc27N0Sc1MBkwtN0icy89s+9fNQsCnkf7cTooaCUNMF2NHRFl4KdYMsXQ
         ydL7tIYkTboFeJLF6k3GJzZ6nwDl1riKsD4kMJ2zOo8jyARbkT0HlwW1uXfspT4ucECF
         8OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571817; x=1762176617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=k08a2EzSXY/yJUuR4xbaHbgNZx0cRJE8eTdgqMUfWb4YRpj2hW8mTHhpWXy7BenxJ4
         kCpKpWrqIbkNmknsCGPJzEVBcAGE6tpGhnq34jJqK0WzZFPnd7mD+0AhBWoTrMyuBcn0
         qqwOe3JMXYDRU2vc4bs0WVyUqpZu+9o8wpZKxJNuFxfJTeNGNYkyh+8ARPZ7Ma0PaUY3
         hKyIkSa+KtlLw3KHZqJ9YKy8RHnibdQZ9oStht1GlFeXD3jXkvYBl7mIeZZHJutjvPtU
         YNAukAWNJYgIKZ5PWOLq5bRe4KBFaYs97lqEifZ9vZFfrHBQBlok1s2uIW7H2zn8HNF6
         +3EA==
X-Forwarded-Encrypted: i=1; AJvYcCVb5YwulgIPEXq60/l3GDwuI863L+puEJeXmkJcHTrlX5+Nm8EstFe8yTL85pd7J8Uk0ixxAUpO1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Sm/SdE9LLj8kgtn9T2UmHS/wEic+nuMZkh7WTbPOUhzwl3On
	JUvnnKfNbf4BCf1++5LOG5tAPxMfDMPsvOb/bSG+2b2I9EhuwW7VdHxhbCLRLi2v3B8=
X-Gm-Gg: ASbGncvEo58KQLXwUu12DZSZOScINL7k2+Z+I+A/+dUMZlo52rTMJNxp4j68rw5Cd68
	Idc70NlJGNyZQIrztdfwA1EHhclJkRXXl92cv4B2RssSldqZnkhhC/dYEWTOrYa4B5dgdjqQ35p
	KRZIImHDkhWPcwaeL64vwRE82MyZQp1IaYSpbIbd+disaZ5SIKsqY+Qpf9TzQt2oU88aHohaW/R
	Et/BXVSxxhoEUKHO8StbekQVGQgwYOn2E1BTsTmvoEKzmY7k/IjEz9qAG+f9n5owuzB2E62TsRf
	ANxqMEUW6rGIJ9MLLdnVJ7fbiy0cnqJ43hB06Xy7WVgKaE4xNcanQOrZJdBzgd8U6gUOjJsAuSW
	GAfAg87jszh2RBMf/BPHM5rSi6s5uGf16Ifu9Zb6wwrQ0RaH+swInaG26jJ/88smGg3aCWB9BzJ
	l0Bml3DoHJCtH452LDKuY5nyruhCo915fWAjD0gEGsexk=
X-Google-Smtp-Source: AGHT+IF2HAyYtoY7tqjtENmVwo8nugPI2UtLxqpWE0EI0lLCgNJiG2I5oXemQ3pGAy09KPpQQnNXJw==
X-Received: by 2002:a05:6e02:12e1:b0:430:ca90:d0b with SMTP id e9e14a558f8ab-4320f7a8964mr1116135ab.26.1761571817075;
        Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Mon, 27 Oct 2025 08:30:00 -0500
Message-ID: <20251027133008.360237-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
Move the allOf block down, below the required section.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Moved the allOf block below the required section
    - Added Frank Li's Reviewed-by

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..1d10cfbad86c7 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -9,9 +9,6 @@ title: Freescale Quad Serial Peripheral Interface (QuadSPI)
 maintainers:
   - Han Xu <han.xu@nxp.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -55,6 +52,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
@@ -63,6 +65,18 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.48.1

