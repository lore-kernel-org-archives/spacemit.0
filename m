Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135A1E51EB
	for <spacemit@lists.linux.dev>; Wed,  9 Apr 2025 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226542; cv=none; b=OLoJfDqD6jYyMprVMLYDTaRXHVkzr5fhKu20UxfZWep9gyvHSybtcuaDJZdyJTclJP2uCGtQFe0FLrYEkQxW43Ytd5N+8OSfpP4ak3raWzxE+ngFiMQNI2ZszNc7Z8hbScCmbQIR6KrbEv2XpVVbNTrm7+eiB/qtbRSYYVeB7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226542; c=relaxed/simple;
	bh=he9IA1+sEmtGpV+RfD/yvwaHIPJw7FZcA+CsPKHLNsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbdB5dRPf0enbUU66vKbKU4MwDKpkNMF3t9zFT22ijah+IJOgOrPxz/dtyFpx8CCdTy8ZP4f3JIRHQijeXNVLWEVxTZSm98bcqE9j8NiWBiSBG/brysOUwrCHpPKsgNaTbwNGN3s3y+qpPZgkDZLWM+ZR9usOW7h1c9rUjYPUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oYbF8azH; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oYbF8azH"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so320775ab.0
        for <spacemit@lists.linux.dev>; Wed, 09 Apr 2025 12:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226539; x=1744831339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAZLFz1IGr5iGWJpnMiF/uKgFNwzC6PY6kuRk72SglQ=;
        b=oYbF8azHuZfOQgBuaStHA8oT7EI9QOI/EOIhyaeGtWj7SsLiI+DrKB18GxS6/Lk732
         VFG1L+mW4hE7XZBzgLOze+BVfVXUDjGf/ZYGQTNFrlmVDTkaPHsrKO91+nTPDsF3FueN
         4M/b1/3eZZH2eFTxfWpLw8fpx/9eUfI+4lvc76I3L99pKJjqIMjk5QmRvtGlu4ltpIzL
         4un3rR2r7LntXRGfZIrt9oXf1ghmRN3Ewy6ax3A+JkwfFQR6BLpYjVt8hsWof9crgZ1g
         rsZzKjlIsAti0/dGbrVgW44DetQa19k4F/1B4qG78GRYZX9ENP8VIkyAh6yLqQt7kalz
         O+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226539; x=1744831339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAZLFz1IGr5iGWJpnMiF/uKgFNwzC6PY6kuRk72SglQ=;
        b=oLYVsro/2hUPxkF6rxPEDF2c622bAZeYgUgAmWYj538g8aOMTFZXQmB9eX7MwcqHNZ
         pBWtCrHzz4xoudnNw0m8lU1BT/LwUatbiilH14lYI9Ve0ljFoewg/Fnz7d+irpcZeBVV
         7rY/sHx1qVYP/06XcSiHnf0rAT/ctGynd0SscrZYZ/JRwEJ6X/0xTa7/B3Sj4+fd39qs
         bCKD4xZNY4Cjaz7dKEk3JMHSqfFlNspJZsJF3rLCZmWPropYSH3hJwEI6nsPjOdL7pmO
         6FpbutOT8o6orJKrC+S9yH0nF4XXSnD3dTW51aAdZQOqmgBI9E6oTef3R5AbjRgwIusX
         PCXg==
X-Forwarded-Encrypted: i=1; AJvYcCWiW87ZoxcWXVtct2iqlE7LTJtZrIdHkEm3RePJssZ8bNO0RYJaj/xe3o9F5Ud3LLfUdINpqw1YCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YztV1e0RaHHB5y9U8hDkTTifH/dxNokyMb3DqFhRfVmsh5w7//C
	iYqA7sdTwX6450A2beKTvE6JeVh5+vhvH68zLR1OS/qWluzcvqxhTGh+2rJIRoM=
X-Gm-Gg: ASbGnctxlCZHVc7YEQkCDzTMUNZF4bxnpPzvhj7wQ9600BN3zR9xUsTGCSUFWxhK0Wx
	NfHyXQJlTED7rTC66cteQXp1qAwoxmKdzm04W2cu70z5e2XsUaFEz5XS/7ZG6Q5EVnMLE9Vj4GC
	ya89oVQ9WRUgeqof27WCRHQiJaGGmZoUIujbqc8JyiKsjbXNtrB3NPuxxBPJKbBAIvzs6uXStxo
	bjCvQfWYPcVLz8Kqc8FqwDiGMvFA3l+KHlCZf3QGKGKNHYqqNjw1viialeAlLWAQqLGnhdDvUHM
	SXsGJvKccYfdyVcQ6c/WzQ/Sy0WW0MPppdBLYPjEiLuJ6AIj2IptK6IZiCNe4TOfl0ioihTBCWh
	h5VAjKR0deHujNA==
X-Google-Smtp-Source: AGHT+IEGuxmewmQbb75m5X7vBqHuIXERuCuTlAE6AMgAdiu3tfh0rm83MqrIv2yAApon5oQTbElRjA==
X-Received: by 2002:a05:6e02:1446:b0:3d0:4b3d:75ba with SMTP id e9e14a558f8ab-3d7e46e082cmr3195055ab.4.1744226539359;
        Wed, 09 Apr 2025 12:22:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: serial: 8250: support an optional second clock
Date: Wed,  9 Apr 2025 14:22:11 -0500
Message-ID: <20250409192213.1130181-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409192213.1130181-1-elder@riscstar.com>
References: <20250409192213.1130181-1-elder@riscstar.com>
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
---
v2: Require both clocks to be specified with names for SpacemiT

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

