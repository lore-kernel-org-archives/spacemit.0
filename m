Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338214B953
	for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753740008; cv=none; b=S+h3OkDHPkMdGAATQV1BHhBqk8ZpzSyP/33gBpecdgTUmeTIy7vpMXanA/CpCeE2jUAgLk3bJJsshFDHvenbQtML4CeCcsriu9ICkiRD1C9rdKOWblm0xBZEYo6UoKB4q9dKLvXdpAlFNk0eGQwF/cwJiIakal/dXaGQSsXoD3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753740008; c=relaxed/simple;
	bh=/qAK7aYKKFRgAJnNBp3OG1T2f+7X1+5mXUXNzKDQxr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swatAfKqWx/ZsWRB6ECrGUE2gPDkVqt5oMdMI7pPLOWcYX5qVRIPHzzzIC5clqc9+qPOpjjYvBWO3Ju0dEY0oeYSG7svmG1g3zyRMoIK82vltSM9K6FuTTpE5bEYxNjghKhaQ1TwNrH+BfQ6rGKg6OFf+iGNeJDjwMhInTalvjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=texO4g6Q; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="texO4g6Q"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3dc9e7d10bdso19394225ab.2
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753740006; x=1754344806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=texO4g6QAAwSPbv6sCQ7CtorIXbkVItZBVdHK36mE4IzGPAngrZSwIT7zK5HGwrWF0
         nf3UkJX/ZRxHm+jpkAW/sm4An4eJ9cTQvlvtd0abHSReM+0eep5x/s7OEllWwDhf+vmA
         cbK4b06nMsdprkyRI7h6xkbOx5MNppbZwJdZCNbVswzjQHCbF2uXluWsyhEpPOC/xchm
         geRQVZWiWodmFUxbBEhTgDO7zrShAW2ZnQp9OKHIzCLlyx8yXyqzFoLiugd/qwjPKsyM
         AdExHfVjh7WiHOLDizv5O8da1CDHUv3vcEMnngwq1hLtJ9jK+qCFojIMS9bMZcAScuiq
         IOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740006; x=1754344806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=iinKGK2K1c8/k6D8OJ/LvuGjRNDW9yfO7hVNO1qpx49Q7fW9PXrpUP4n0YowyEfPvZ
         0meCAzF3zCX+Irk99lsrGSJ+0TroRppO3XRP8aLS5McqMhauNsmuuW4zM6yVr3vom28G
         B4AGbtFECNBR7Vze4AK1wVs2z4WCdrDamJwrqVNk1wmngvDQAfEO6LkN/1pMyhDI7QR9
         c9OKBsesS2gpeqWi1KDAx40hhqLiRPuHOxWt/RXCQhi7P/Vcf6pX0xYedoq6UzA+5kVy
         XmkDq6xD8utRPakF5fvBouQxrigWQGRepcBHfHx0iBCOTexZ2uv9EG4bS79jgjJ5uDYK
         iRvA==
X-Forwarded-Encrypted: i=1; AJvYcCVSyW7xFVW0qto+rm+fvWpJQvAt/s+yEZleefn7Srv6gHN1+MMcni0aSrMzHJfgSi10ksqM8xEHwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJypUz42azIei9ff6mhh4vmKhAFjmfUfjJ8UCPUQuT6SC2Ey7B
	1m3faFDpN9z63cUj5Tp5az/QYZDdTpucQh1vYHEBGm1JwjOmL8mw6/6n8QTS0wrREC0=
X-Gm-Gg: ASbGncvJDcCcsImA403DM39kcmsDzxw6EFr+SxLbp7SzSTu2XLXTnWWfCJbgKnTN6bw
	L+gqZ1QHpOuYfDeccMpWC5nMmVRFOXuyYiu4nrdqYhckPQCcKSyeQqLUQprZrGTtrUPmvwN8g5b
	WjClWTP/vDBO+gchGRt+8ejD+Owl/T/FyysbwhyIe02CIOmLbNocCqcgV8dOHgIZnmrZUzunk2j
	oaw882MT2Mvq686CTi0lVyyzZY7Fb2/DkcRTSWAUyJ+FCDdWaUWrT0CTCX3HnQsOB1bEzsZtm/k
	AdFC9qGBj5KFLO8Eu4W4KMB5/yOZxVvHkpC/7VxkboGWrKrLmdx8N8FGogUSfXjqvOIPpIPw1SC
	vyXqlHFRQ2qVVt/R8Xuo/YUmjz1krHEK9mRVTvuyueDOOf/KXjbuimGc8CIdw4/lyNA==
X-Google-Smtp-Source: AGHT+IEInGF/Uihao86Df5Hh8l2S/n6kOMKGVWM1LdBNeEbSuGAD9Xt1OLU4ny9gFPGHVpMlKG5tfQ==
X-Received: by 2002:a05:6e02:1d98:b0:3e3:d185:9163 with SMTP id e9e14a558f8ab-3e3d185932fmr133375445ab.20.1753740005684;
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91c9fdfsm2167331173.4.2025.07.28.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk
Cc: devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Mon, 28 Jul 2025 17:00:01 -0500
Message-ID: <20250728220002.599554-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
named clocks be used for the NXP platform mentioned above.  Extend that
so that the two named clocks used by the SpacemiT platform are similarly
restricted.

Add "main" and "uart" as allowed names when a single clock is specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..cef52ebd8f7da 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -61,11 +61,17 @@ allOf:
             - const: uartclk
             - const: reg
     else:
-      properties:
-        clock-names:
-          items:
-            - const: core
-            - const: bus
+      if:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k1-uart
+      then:
+        properties:
+          clock-names:
+            items:
+              - const: core
+              - const: bus
 
 properties:
   compatible:
@@ -162,6 +168,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
-- 
2.48.1

