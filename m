Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5736A611
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 19:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333361; cv=none; b=ZDGP787v7ynwRUYK9iAoa7X3AZLKs9zNRWv2YyR0RheXfH1dA4utVifahZ/oCEfcBOpTPZixYl+XehcRgSv8rbYQp5bvPbbmJAIABX85IV6ZmexifEZKDf58UWD4M0/pliZ4TrBFb1ByU2KVbWLJXkiCHb8KwxthYb4jZVhr1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333361; c=relaxed/simple;
	bh=spWtt1Pp8phvWIL1ongPyy50mYvbEr24rP0ZYo3c4jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibSNt+tQSWkvOTDJwWpMBLLv/v9lT2R+5H2cmWIeZPS0hBzTd58BMpta+w6cxvxPJuKxASqtY8Ur9JlEORhZjpxDGC2gDG+s82HE0WcHMU/WKuYswmgn7MbHXrr5iGZHUmAaw4bHr88llxkEVKvinlLGOroQjOi3Ezto69ZY9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NRIciNc2; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NRIciNc2"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-430ca464785so24063555ab.0
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333357; x=1761938157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=NRIciNc2dGF3vfGBJNkR0Klz6L2RjaywntTim0aSQrAaaYPPQ1Md2uqTr58Uj2r9an
         BOSPgsQjevJK1drJEpwOydvTg3ElYnwu0LxmKeD7z44MxA0EnOkeJ+aERcUJauHijs10
         4155Bl7CHPH86/kinMrrwuAJrvQoIe3RH7OttAcMjyhXdPANXlPJo0T0yTnt0kyLa0/L
         iNo+F/HFLHupdbz4BOEgQNp2AroP8NEeWrRpCSCCecXHTsVXfQjKOc4QBDkR2E7rQ91P
         Vwx84Wbu4lw5Sk/BSQoQ9GQlUkPWxcMZrbDjHwyTzNZC56t8f+s1SLqvsjRpREqzd1A5
         oQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333357; x=1761938157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0sSxMmpgJlm+DBHdJiFvMNmeUcFKdKvsAUrpyjqesM=;
        b=OfQpYnJ9Gr7DsLQZoEdxJ/aOqfm2Ca8dYyXCPi/I6C+0c3EJzSInaLctjYTDHDAtMV
         0QApHL3JlaLzH2zDQQrzyzAQNVa91h+CJSEKaP6OqYmFE5PB4CMss87AIxwxXW2tSygE
         f7/5j6bVsrtbogcGroreCxMdgysvYwHSArLxBxp5RGBCSGnrWgYTv0BktAhRWkVA5WRW
         MZ5cwdC9socv3YNNVGU6f97PVDh7/4pcnNtsvImiM7Oz5fpZUmOFJSEU+vHrDcqWjk3k
         TP6AYV1RBWKOXe9TdNhrF9HI8HBQQMb0aE7SQ302z8ypZ8NVuCT8XYkySVfwMsHs+8Ah
         KlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNI7Z+DjjK2Zj8ozlDIdcL934KsTwheCvVR83Y2AMRncf6vPDR/MwI9S68q5kg61i+/PxsWwVFKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqpHBLk9p6NE1UwUuf4XDV8mNs2ox1GM0ODlzmQEkf4/pZUUfk
	97lymGM3CuM5SH/11OLiFyn/dvY7UCyiexzvXZYaB4WLWDZiG1j8ERfgEghOtXjiaWc=
X-Gm-Gg: ASbGncvVRVr2CBbO1DmcuUTRVknK8D9JNE1xrVCzz4gxluCNsKNn8JOua40DG2pBd0/
	iV9Sce6y3jjLM8MXpIYu2q1mzz/wW2zXx4TJv2gqhpM02w1LE46av0i5+QiIqGm1T2SeF9H+HjN
	OR5FAdwN6khj0e7Nykbc2qTK796lTN7egUH9EX2C4C8fBfSSgtjOwOc+WQHwrAdzTNA25jsIzis
	HVf7QxXKrteGjLaYV1WtoefSaMwIA0q9mfe75ph3Z1jH7RdCV1LVA2+5p9edP0xbbLJmbJALyIl
	Uw0apP2YuMRtEa5fQFrGpMpnUGFdxwPLBYBLIirp/1cHRkAkk7psGOEBrH8R1B5QmJX/ZpeuBmY
	vrBQXQsG3QWpQH6E9fBZyticYTnAtBNopyjvegrmIND9RUvB89JR7VxRlAnmj0fYAOmbnaOH3Tu
	4TqRvsThhaq1SYsVv16QypKpdYLxp/YpIkh1WRcnzfUs4/B8T410H2YA==
X-Google-Smtp-Source: AGHT+IHFcHZhfeKTHaIT8TeTse7w8bjG9Loy1iIsFUAysOy7saMHPhRTlKWgTzZuCkFXEhYPt8zLNQ==
X-Received: by 2002:a05:6e02:2590:b0:430:9f96:23c7 with SMTP id e9e14a558f8ab-431dc13b52bmr101093185ab.4.1761333357439;
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:57 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Fri, 24 Oct 2025 14:15:42 -0500
Message-ID: <20251024191550.194946-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The reset property conditional is now under allOf

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..46e5db25fb107 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -11,6 +11,15 @@ maintainers:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
 
 properties:
   compatible:
@@ -55,6 +64,11 @@ properties:
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
-- 
2.48.1

