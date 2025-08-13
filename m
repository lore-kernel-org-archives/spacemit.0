Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A221271450
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055318; cv=none; b=BoJzxb/4D3kbqha7D5NjzG7DXMdQ8fP1jGHKD902M0qrQit+VR7j+9Hgbg559Zp5D2IT1tLpf/hididXlhtc5u0GbsPmipCFYx9UxlUILVCfPXXc7LrFVKuIZ78y6bMZhV7wed5buS0my3N//BKFtoJLTDPqThFxe1yHgROHj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055318; c=relaxed/simple;
	bh=QXvZG2q1wYALZ9ywXDBmZP2Lg7TZImln+AWgStp7op4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ov2hs6Fi7KEc0jZTtNKLO4JUwfiw/F+z+kbJoGJCS5tRlNLWKZzYPm7ZcSVwRxEVNi9THtnOCfaoEgoQJp+JAWOx7k6UOZltS7oNEMY0kEf6syvn3IiyJxHtJp9Rec6zfUyDnDCH7w7r+RAE9w4DEBrERgYwVKaT4nd0eXNPKnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ujH1aM+t; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ujH1aM+t"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso57677675ab.3
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 20:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755055314; x=1755660114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZh5F0QX3EknECzCmYMfb9xtWVRUzlviyKurejiq7Q4=;
        b=ujH1aM+txjfygQbufcLSShj5gReGB0DiBd5rfK4XpPZKYZr4JYzFXKz4Tz6lkKj6z1
         7nhHskK1tTt9nuNVPcyrICsQ/EYdVIIvbKPvM4jZG4GATx2j5ET3LJp9/pBXxIXyenUK
         +N6FBxIzRnHKiLYNKVfYNQKiP0aC+WjDrwwST6JBfk1cxtV6on65khXFU9pe2dIqDfXw
         3Y3dl4v3JTA46DBQE+gCce4S3DKgKsPoR2Rn+rNjjF491NRHX2gHSdKMTem5S4up/Zmb
         0j6iJQNmXkt4VQRe7Es9nNDYwEvBhWJr/1GlZ8y82UQGm47YE96atjKSVequ9Nfvy1iq
         7QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755055314; x=1755660114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZh5F0QX3EknECzCmYMfb9xtWVRUzlviyKurejiq7Q4=;
        b=ZqypiADeHkx8jXNsD9A52pCrVXFKv2Fq/Fu0ax/MDrRew0RooKznHcMDpaTusBBDDE
         jpzbQGECNQBxmj47/s1e0p4QYYCScNWgwur7nExgXiAr1FUewLIh5624qh9UqY2/KMna
         o1TAcZbZRpmxYmjkOeTmKh0wyXEo4ANCUiycxyrd5Do01ThnF/WwpHW9ypcnNtKakf1Y
         ftr6D2otanGeauFPze4O/Alk+/4Ae+CQThhFISr2sTbgGZvGv5pjX6v6XLfaEiOMyfCQ
         s2c3AIWf85gV6vyBBrW/2SZ1Ql1sT/EuV1dpDtSUzzuZRcjXEDqy9/e3VjKCj8QJpeBL
         IOOg==
X-Forwarded-Encrypted: i=1; AJvYcCUaBsvq0CZ5Ft7I2DC1UkQgjhiivGn8upZEpb88xrormqg/OIHDgOnZBWnX+ARF8dQJgHzlH7bAAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw89F9DX9xAc6pPvWeop+GKvwpyvSglFDwP+U3KwdoG8CmGCwc
	rDqOr2yWAtPuBt+6nx4dgqHyZ9eotYfM9CsvzIeZ11hi/GswRS+CRIKyU010TJFV6i0=
X-Gm-Gg: ASbGncsl3PMlIggwiAWGbCN1pqe98qZAYKMtVH1e5ulnVxPaYtVAmUKSiVqtTHpMUag
	Rwab+XB9yVix9GOnOBwBhJW4U2W+s8EDSb4JWgS04g0Z8Tt/IBcuylZErXdW5aRQsr4Irk7PPXn
	HWXwS1Voepe93/qmeKGG5X/z/KonyKRk8l5bdOFSvngStaAs0nVN3UmSOlXT/+jMk/b8JJe914D
	Yjdoty1Rbb17G7pKddDeSlMrneMd4zIHahueIyX0eylzu0RyS8+K71KBVNEZRsFyk8E8vgsUHFM
	Na0o7bW5eQIF36s/EIHZGR5Ez6mWWo2V6ZEOkJ0cfmz56iVKwZ35nKwd+Hm0J+hXbfK2No87U5a
	YRgSqOZFkODVZDu+MIs9Y1NUiwkPWLJINrpnr9ncnxDNjuHafY+RGAH0HnekvcSLasg==
X-Google-Smtp-Source: AGHT+IEGjkB4ovYyLSKxeQ7O4Oh8jWvGVbE2gJKsffKwKHW4yl0n/kstE9uKuxUw+5W4Y4U9OyRJLQ==
X-Received: by 2002:a05:6e02:17ca:b0:3e5:4c7d:b799 with SMTP id e9e14a558f8ab-3e5674713f6mr23473385ab.13.1755055314466;
        Tue, 12 Aug 2025 20:21:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9cee258sm3453085173.99.2025.08.12.20.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:21:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH] dt-bindings: serial: 8250: move a constraint
Date: Tue, 12 Aug 2025 22:21:50 -0500
Message-ID: <20250813032151.2330616-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A block that required a "spacemit,k1-uart" compatible node to
specify two clocks was placed in the wrong spot in the binding.
Conor Dooley pointed out it belongs earlier in the file, as part
of the initial "allOf".

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/lkml/20250729-reshuffle-contented-e6def76b540b@spud/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 46 +++++++++----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..f59c0b37e8ebb 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -48,7 +48,6 @@ allOf:
       oneOf:
         - required: [ clock-frequency ]
         - required: [ clocks ]
-
   - if:
       properties:
         compatible:
@@ -66,6 +65,28 @@ allOf:
           items:
             - const: core
             - const: bus
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k1-uart
+              - nxp,lpc1850-uart
+    then:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
 
 properties:
   compatible:
@@ -264,29 +285,6 @@ required:
   - reg
   - interrupts
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - spacemit,k1-uart
-          - nxp,lpc1850-uart
-then:
-  required:
-    - clocks
-    - clock-names
-  properties:
-    clocks:
-      minItems: 2
-    clock-names:
-      minItems: 2
-else:
-  properties:
-    clocks:
-      maxItems: 1
-    clock-names:
-      maxItems: 1
-
 unevaluatedProperties: false
 
 examples:

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1

