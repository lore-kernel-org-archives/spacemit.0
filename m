Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF6D20FA98
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386268; cv=none; b=aUZyhcJH1a4HKfFGFJFsXcYkv/1+DBZv4TURTVPTSZ3BB9g+pUTkX/RdfvoFy3jGoAaGXPzTC89C2sfuw+b3Eb6Ch3HjDK42kqynZ/ioLOdMS+YHNxtIvUe6TW4cVWWXIYZAXsba73IyHZGlXk40yoYi1D1VdOE8xblmk37syEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386268; c=relaxed/simple;
	bh=7ZoS0xY5agHPaulRb3cD8XGDbf5Uto+nLhFfKAqokok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4J0nDU4l2IXwUCNThLTJGjcBdqg6Bm2SH849rACt1ySL3ojTeLB5LqDBv3Hips/huPrdzEH04Zrmj67cMsOwlYzmr9W8HxoFu68ZOKvksboHg5xak9ln0v0S0tobU9DnfP0g0BJPe4iTwNcSawR+Lpdno39Bn1hLCHBgmAkweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=A7U5S+1m; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="A7U5S+1m"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86142446f3fso54613039f.2
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744386266; x=1744991066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNEtTIi2VK5ry0lwico5I+3DkBAdLoSFhiEvmP3qbmk=;
        b=A7U5S+1mBcTldXyCsmy4dWQ7fDTiCKMg+aZZef5RP7KsV96KYuWerXVwDEYb2lA853
         prYa7jasppRZxjvZNUrh6peMwnbAFlBgFqKkDNvbPUR2VZjNSCsNPWNZBBwrGI6sKPSA
         6GCEwOEuqx/w8Ia+JD1uYv6lgwgkOMtdROQpz3dMVuvwCtkbMwGyBClTESC9EhEQiqhU
         f8CAEf5MZ85Q9TvBXZXA0HlyUXs+maF4aAJ/Qaxf0VDMzfK6s7+j+ikBnrqEgsJKbqpa
         Gy2D1ryweEzjzaVpEFVjpnmwFOFOrSaj92TbIpikUMJXJDNbKjXDVKMttWFMV+zXwne1
         /4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744386266; x=1744991066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNEtTIi2VK5ry0lwico5I+3DkBAdLoSFhiEvmP3qbmk=;
        b=Br3yISOTeNHqvntkOZL4LDi6pWq7BitOHhGL9BXuZcNGeFzcHZeuWWgTEmroLJB/Wv
         N3Ooqb6HvF81uF1oErvmhkivAkYM4vfTbt60TX7vwJ6xSfelFMOELrmf0jDxJjc5eLGw
         FyQOh9HsOQgAhZnl2RskG1AvaMBGZVcmW9y7jt//GS5pE4vFeyhFYVyGXNm1FIp3fnKK
         AVkLAVfaBaivKf8u+heYDYZ5UBC1UtCqO93wBD2WNiJBx9xuMUxtwUq/yOniNncoC9Sy
         0C0N7haLiWo0FFb1TyqYHC6Sdj2ajlDuelPWrM6h8JkZaOgpEst0UNsTCOByYn6GapWf
         Mbrg==
X-Forwarded-Encrypted: i=1; AJvYcCVFMe9jAPosGmQ41M53dpcBgspj9YgLJ6D8KDCJqoxyuBhoig1k+LcB/JlC9gOhxAVRKOopdhwwkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbGs8W0rQFBZ0B6jxoutXHAIvsS1I9EW5hOZADvaYbKcZtHYNH
	aCJlFYBmotnDzRailgK2MeHpMTzze2FqCFghYM5yNTNE6xCi+LoOV9JJpEWY308=
X-Gm-Gg: ASbGncttNTiCJHySHx12z7REYcUyDM4ulELReJZuisPSqWzUA5244E0giYbWUb79bPC
	Vf9+ua+Yg063ggGTi90EKllPwrHU3PN9KOcOwPUuX0c68p4t1SxxmJzojRrpdkdpG08DwHHFSci
	Yb7iK/9oPxXe7NuF6omXZ/Hq4HEakxjZMeW+nNoyfM7eOohGih63lczkXeBYQU8uHx+pKghNsWp
	ePwDm1Dk91+GQfdGkd1gsffwWIYF9RzPYxb4EH30T72DaNVZYMexHT8fmmPQGlTvnpmdmaSz4Rw
	X3vmHED0qhg4GsdA8m35mSnEeBgNFQnDINCzJg2FB6u9QGDofMim8Ta47AKGKFo+ekXXMG9+D22
	WPMBtiJUtrEl+gw==
X-Google-Smtp-Source: AGHT+IHmZJkLUp0ElYixFb0pqy12kzxcoZbzdEnj5SOiajP/nfCU4MY0cVdJxZEZG4e9zsnEIRAxIQ==
X-Received: by 2002:a05:6602:3789:b0:85e:2eba:20ad with SMTP id ca18e2360f4ac-8617cb4660cmr336071839f.2.1744386265918;
        Fri, 11 Apr 2025 08:44:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf812dsm1276326173.18.2025.04.11.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 08:44:25 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: serial: 8250: support an optional second clock
Date: Fri, 11 Apr 2025 10:44:16 -0500
Message-ID: <20250411154419.1379529-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411154419.1379529-1-elder@riscstar.com>
References: <20250411154419.1379529-1-elder@riscstar.com>
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
v3: Added Rob's Reviewed-by tag

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

