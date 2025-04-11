Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F0126BF1
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377297; cv=none; b=r+D+Coj2q0L8bl/DqrbsJvpEyNL/5T+Gvd9xcklOLgpn3iz4E770cZPWSMI65xU+/nnJP10th1pxxOnkPBTUmGNxvDh+9YYCPRPkreNXd/B/KrYHmTBDI/UcJR6euawPpEACtKTbqm3qZDaOIgQ8oI3bWYVtksB2csawT++kCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377297; c=relaxed/simple;
	bh=Fx2DSj48yYrVxbWj0sHoE5Kp8sSclZ5JpAzWIKIi5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4YjDu7A0BioYbxwy4agQdy4QcChpLPvpLS4J6Q9Tz+q9Hw+KUGdQcnkJM4MRsdZGxpqkh3X7hiiDzUobbIv/kZ81uxFzssBIhgTyHXowIlSo8AsXZh3lOWxnS5A97qHqpnlvgzIgyKn0/yP1G5ZZvCJFZpdURqtAR/oBVtJe+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=H9A4x/TN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="H9A4x/TN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22409077c06so27409155ad.1
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377295; x=1744982095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=H9A4x/TN/RCLXoEvORnRwtcKwmXcoFcvzFZ0XNVnuaS2uKusFj+J9/CqGkmLkdqUt5
         VM4szHWkyWCc6z3GpyHy0GnoapCZvIqyCNCxmnMhKM7MYGrAZtMPmadqDn3lwaEHwWuW
         3gxtTCV3pmTM5Df50IFkM0QlBJsXFZcmBSqqlJF2JTvJC+R0I4IkBLvpGs8NW0/7Ck9a
         cOuP7Soot6o70rh1MTmQgphYH+r8EAkv7cDO01yfgXUJq7COp0FNUfBRyBd86SgC7G60
         WH2KAMPFOzIjvTpWfgtL9UQ2k+KUYBejqA+VdAz6chsjFkOSHd+vbBvp4D8qZ1/9N5Ev
         57BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377295; x=1744982095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ9GjvnopZqWsxEaOWAw2bgVB4e74J1JbKJhf3MqmuA=;
        b=eBWBxweT/Cbx4nX96pE2TgvzH1eHfApsjrclT/LWx4NgQZLiDbTUgQmVYVMKLqE1aA
         IVTc+PankCatymD5t7pS6vQIeuepCCDsscDZI/g4VKocHcg9k92rvlsFWBHgUs5AzXPE
         1XZaBh5mpMuU0eFO5cFhK5B6FaM7r4W40E2CqomzkJLVU2UauHEj/UT2Z1wxRTa68NrB
         r26ZuqEGVg8jiK84C7E+4YeRNilCaG6+jzUynzPASRtE/7/WRFKvCz1vsAmEa6C0cdVr
         rQUgd2BBAZnmDmyrvLORKeAsf8Mr1Nqu5PkCFQidzbjoyDAS5lhVgmxpynOC5ebzGxVd
         6UXg==
X-Forwarded-Encrypted: i=1; AJvYcCWwo912O+wAEh4tMRYL0XO6UIcSSWCh0ju0f/xRMbYMUeWuV+a3gGGDU3laCJk7/vCmLzTlbzmStQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgYYx8dl/ZBvI9uHRj2gcZg2U/LysNEpPTc7Obby/TACSZcyds
	cUgokg+C6Q0Oep59JrrC+MDzPKPTRpGaVIkUX9rE6yvhElu7yW5/IfoDKxyVUQs=
X-Gm-Gg: ASbGnct5p6mIJTmyRSXPEGzCyRwolsM9PlM5AsZKN0MAW/8Xl2cYZNNpdyifpJoXZxY
	LRz2tiuJwhxxbq0vOATgCuwlKzFvPaJycQ6cUUsU9Cx3YYUa+BVCZULuNtoRnr+kQKiCCzOreTy
	WxDvfj6RqkjWkwPIYsx82kmN97VQL6Xa7cAm/hZDbf5JRIvJMDViM0ZsapfMB0peF+tshASiQPx
	P3kRCTPZvMsfmiJ8jWxWq0ZWs+yI0Mo9VApHVhmRSs6wOC6hL2WIDXTRl0GitPTZYIfqk0leXLw
	IB1OtWY9AREnlx5adUK7UlPa9zyybd8=
X-Google-Smtp-Source: AGHT+IFvN5I4E6ZSZP8c6xGMaFyJHcwfDhA7M7Bi4ibh+3ktU+m85bf3AQiHdiDWUBpOoQFNec0A7g==
X-Received: by 2002:a17:902:ac90:b0:224:192a:9154 with SMTP id d9443c01a7336-22bea4bd78amr30197535ad.26.1744377295221;
        Fri, 11 Apr 2025 06:14:55 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:14:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
Date: Fri, 11 Apr 2025 21:14:15 +0800
Message-ID: <20250411131423.3802611-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an optional resets property for the Marvell PWM PXA binding.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9ee1946dc2e1..9640d4b627c2 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -31,6 +31,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

