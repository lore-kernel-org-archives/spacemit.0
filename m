Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C6F469D
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107224; cv=none; b=JOJW5+DZwzutGKmepLh/Y6MzINyuDlBqXFYMYAtkMVZCEtnK0kuppD1OaePBdnRQpPxCUHmdrXi67qZVUMBGAfw2f1UiE1Dd2u/uyZMzeL92IC0RnMLulp4ycTKM8N53tftTnFFtqg0nOV7yR4jhtIQrJrdFsKDv1vUXYVnNioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107224; c=relaxed/simple;
	bh=CCIkxtH/rocO+zZRCAtuXg5JuC2j3kYenNoG5NxM7vI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gESlyYLlzMBM4C5uQx8/S62uHXtvNx4hct+2zgOVl/kp/ubASHxU9311FHugX3OTGlBEv1WcR+ahcR3m+ogbBpqWdrTjG5SIJI7BbMkhQfBrxQUL3MoT0TvT0H9qeRBVQnTqs/zfgpuExI0SMaJjHKjXk0o84nIjLUtTfMc/yNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7kuq3JF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7kuq3JF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f2676bb21so135494395ad.0
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107222; x=1767712022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=K7kuq3JFIxEn1FENtFdhN+aerB7XQjFcgiDx4NmsMGW+rv1462KjFLbpQv9OFHjdC2
         zm/wvBPNBIDCcy137KOdJJKZk+RyNIgJLF6o3sq3tYQzyyQHeQApMeRs5S5dE5W7+q5E
         oGsTAwpA2VApUBTRP6dx+2YUTxo/MVXNEgUvJcA2vb4HhGan/vY0WoS56J4ZeThlB8T2
         10zj5m9La6a9jGYBigfodHjjt+ig5nL3R3D3LJX8B6YWy2Lbd43N26g7ThxaPe2oc9mz
         AXagMJMIlY8dlmxdZNd+hlyHQVVrtFH6o/mdfssN9AHYc2idktwo1Zh7GebqgmTQB3Ad
         Cxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107222; x=1767712022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=HQw6yfCO2IwT+Jtwl3S4UZn/ek0nCbfk8BFrVd1JkOLhYzavT4IdGY5yDOm/TojYLr
         Ta6zYWpLw8BgT/HIeJ+t6dTMQN2vb7jNP4131RWnBPZ2DIflGezZpRqhVuFd2nPYcGl5
         bcnW3KEYpEVFRK9ejkbTf74NeRp+xQi4taXuKmNs+bxBaQkhHY9nzyXIalByKXeCEB3K
         pTw1FhyaQipRKkeUCp/EKrcSVPlYkzOV3iDP2D3nddJ6W5WxD+Qz+BTX/E6/qYv2G9yT
         TZCCDC78p0Ffs/IgNIOZe+VHy5BToyzgP8jJm6lA3G30FaTLB2fH3eM9NwRxjeDSnJ+y
         NBnA==
X-Forwarded-Encrypted: i=1; AJvYcCWC6Zf0gXz7HUQY3TF+U2V/0r7AaofcgTrG1nKeDa3sPsg3djimYfCre7s6giUXnQ4H+c7JuZDFzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSAkmsz6MkTsdmAyEuVq5VmsbHQ3KXfz4qATaffRKNwTg2JF00
	smLrTjyyLlSfU0qH0jXcObJShDXugtsuHUnXWHhGZz1Ek6mjuUkVKTG1
X-Gm-Gg: AY/fxX4+ki5rGbXqRo3oJqi7zSRTdkOpV02JfbtKEUBZqXsPNQYjdNehfqhea4wQou+
	heQDC/HdvBSbLsaWJAhjHkr6c+LH/luky6vAYTSi0SqXBoHF9W7gGhNXaBGztA1BMWpGKjHjMNs
	NwrL7M93PJgyYyAro5sFxxC6x4i6deS0xhDjoiDHGnD02NrT/1nPDsMgLCoIYU/Q9UndJiAOTq/
	mXZwtrs39p8+iZsp2W3ZjL7ciUbNV4dVXq7QCRrZAPuGIbBpgt6ABBA4eQ9JL5rhGTwmRDIzBZd
	0cPmBKNS3IffcysAT6/g10zC9X9bIBhgMcbX6fY1nsXPq7Wvmm6AehTDDaHjx3yxGhO1x8XM/dv
	ecJHN7zvI4Rd4n29a+3kSItkamnTHCV5gmOeec9sKruc2UED+kVrRGibMKJz8V++Eb8K2CPGVLN
	WVSvkv
X-Google-Smtp-Source: AGHT+IF4mlQHloICVoZ4fRZRB5k6TueSAxDDvE3GQmVRBYhsflqEoWLyLFOrsYFcTTyvrCL2lLxibw==
X-Received: by 2002:a17:902:e945:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a2f232c8a5mr357039835ad.20.1767107222036;
        Tue, 30 Dec 2025 07:07:02 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm298919885ad.40.2025.12.30.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:07:01 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Date: Tue, 30 Dec 2025 23:06:51 +0800
Message-Id: <20251230150653.42097-1-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..5896fb120501 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -41,6 +41,9 @@ properties:
     default: 400000
     maximum: 3300000
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1

