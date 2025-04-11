Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899327E1BA
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403918; cv=none; b=f/wHf618LioHe1lY9zmuN/N6367JcHI4hnlZzhsn4HqWpxV+EHa0QuuQvF/OO1eS0x/3hFdGvwB2Dvc9qWt5cvWE18qfA49Eto+laE8cGCTDdy7jnpiK8Km1wwP4TGVS+PEkWQMDAR78j/HWddhi9cyzLUocHLioE5mFwG7U1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403918; c=relaxed/simple;
	bh=kgcUq4gxhAS41S/CjHcT1RY9hEDolidwVa0J5wWVKTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lre7jtygkmAFV9OpexSvBDtUVyjP6mPyln2oRoHpCkWaaS7XPQvZWZEYCw5G1oTpAZncfr/uRhBqx/IDXCsVOVXaq7WP9lQ4JL28sCFZIWrDnHAFDWxOGsoNzm67ZNr5dp540JE3/REtJzTbpGXeO+phVOO2iCROZS5f7tuQM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nSLyjIRk; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nSLyjIRk"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso20175165ab.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744403914; x=1745008714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT3eKW0OgVfu/zUbqU6ev7ARx/bWRnIm3eKXRAL5nSo=;
        b=nSLyjIRkef/O4xwqqi4Mg8Ve8kMLvfMparnRAl5iM6ZTGrML7GKdsZ3MgmNdpwOOdt
         JXgEm7/Er03TNcGqH1CY4KZ08NTm4IiBlA2xDgmOMgTyAbJhF1SBLdAM4EW/At3Jdxxb
         sMAbH/BIcbRpvHjmvkfUMELbQMzlH7FcMvmnGIx4j6ubxyfGIr708RuLLdKc7DaSYy3Q
         SnUEW7pFTx0IB+tqgqpaaltNVvR4IpfUs4SforECsSWUiw7DZ53Ur6i5p5zzzUSpeCCg
         3DPLTbnZVy5z6htXoR+qCg5sgTAIw/ho7Xfy51Y/F4MnJyk6IvsYBHlKYEvR8vxtFmt7
         KSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403914; x=1745008714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qT3eKW0OgVfu/zUbqU6ev7ARx/bWRnIm3eKXRAL5nSo=;
        b=rLue94xsPCOLdC35GUpMjrBJsafDkH9xj18/1shFohgT+PRYLZWeZGtStKhnl6fom2
         40iFOXScnXEirVHbh9KleHgZnfIIYHuWpeIdNYcyxsmtu9D1NFX4M2DjhMuNtTVMK2by
         QhQOmNaN+ZVeooHj0r21MkgvC0e4hutCs8g2ES/wzUM4uWmagOc8T/i1dM0rXHklC1I6
         RVZ/EgM0oAGg+ue0jKiRRQFBTZxJtNwIuczfps2wlHvNztke1aYmRIcs7KZGF2pv4VIO
         +rB1i+R1YiZv/LDIsos+pnC/aYMnCVZs4O/AsgCLxC+TtG9ApC1VjKbjgtmLWK+ZYKZY
         XraA==
X-Forwarded-Encrypted: i=1; AJvYcCWdLF8pfO4eCvELXMuK4Y6B51XcSE7QWHmWpcuA1K0erxq5J6b6/lPt+Xzh/84iwIKOUcSSh2DTuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+FZiLaksud7HcDYcildjRqfXUQ846uAVvhZlhEpU9CbskYMlK
	mRD6qf9+adil83o/lhPWvZsWkTE4juLEaDPvGExpgmuJSWIOmabia4kHV/u36hE=
X-Gm-Gg: ASbGnct+hpMeEb3HQJVmEviJVMQuTcrVedZxYSU4PIpwzZLI02OPRDutR0TybUwgKC4
	H3d1Oy/FhSKh2vmPdMmz32FaPE7LYsAXfPfpkL+KS3N7Q7CcpY0+r8vElJQjpcGd5z39ELOijya
	sYKt/QhldSJ4ld7xJLExmNz6ykMEI6aWFjYnKfdVU6QbQlmwhqRbMTh2ya2HvCp5+r5uNt8u1d+
	PRrXKwB23PbidbkKgKOxbNc33qmBj9WwOu6v4f6QRCpqkBK168owf1zz8LbutDcHFTtO4TPWFy/
	n6XbMTGC0dD5ckU+KYOO/8KIAGrcfcYl03wD+N9Q8pdCEkFLPqH7gNCdJD3I8LgVL5XYD2VMYpa
	YfQnh2T+rzqnWrw==
X-Google-Smtp-Source: AGHT+IHNU+YtLYKKg9Rbak8AqmRKKNb3APAoh0D667oTnKj2dbdwTHDE6V53boBISDwawaoWJ0qvsQ==
X-Received: by 2002:a05:6e02:23c9:b0:3d4:3556:741 with SMTP id e9e14a558f8ab-3d7ec26b630mr50230125ab.17.1744403914302;
        Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2ea1esm1420787173.123.2025.04.11.13.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:38:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: andy.shevchenko@gmail.com,
	dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: serial: 8250: support an optional second clock
Date: Fri, 11 Apr 2025 15:38:25 -0500
Message-ID: <20250411203828.1491595-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411203828.1491595-1-elder@riscstar.com>
References: <20250411203828.1491595-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART driver requires a bus clock to be enabled in addition
to the primary function clock.  Add the option to specify two clocks
for an 8250-compatible UART, named "core" and "bus".  If both are needed,
require them to be named.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index dc0d52920575f..33d2016b65090 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -135,7 +135,16 @@ properties:
   clock-frequency: true
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: The core function clock
+      - description: An optional bus clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: bus
 
   resets:
     maxItems: 1
@@ -224,6 +233,25 @@ required:
   - reg
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k1-uart
+then:
+  required: [clock-names]
+  properties:
+    clocks:
+      minItems: 2
+    clock-names:
+      minItems: 2
+else:
+  properties:
+    clocks:
+      maxItems: 1
+    clock-names:
+      maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.45.2

