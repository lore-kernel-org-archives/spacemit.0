Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6F948BD46
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997197; cv=none; b=NIh02TkaT+ovl6WlaA6ltuxtQv6yACne2nIC/8fnK/xyO7BYvt54zi7NwyA1rs33457uXhEP80XlHH5j79e+gjI5hH7S3V7VhC0RKEo19+/x4LLw73ylRLoa/8NfISad4QTy3DeKunSsbAvkRuILdoEzhf88G/F7SXtFrJf8lH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997197; c=relaxed/simple;
	bh=UWvZJMVvdMQqYBPk16YJKrNtxTeNJqcgBDsGBMVGGyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gA5IITycY6Bpwt1HIqeYc3u7MymnBLoh2kzvYhHgGpyQDbqA5r6yQDus38CADqH5i1Z7bNO79yFUQBJJtje+XOIleVfuPRc1AJ8JwKaU4rmzrCkA0dAhxiUOzkj4POH6PJecK7tLl6Zl8/w2oFfQ7WoIdqrpgZNQhIN3LDRm6O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRoruvEB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRoruvEB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so64556275e9.3
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997194; x=1778601994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=pRoruvEBi8EBk3SPdIsWKOUcJWBWgt6UOSr9g7yK7CjQkae+jFaOsBLdzyeIbkMm79
         qs9V9UvADftrmAHTDkfmc7qwmhRzdjtV5NGAshpU8OD1nfW2tTIR/D+bo4ONtUiBb22B
         FoYb0TLx36RSdAhusJCse8ud931/+I8KhHzpRL2M8FgE5G1asA1oUajkYt/g/9R+SJQg
         pf5vh7U0ffKu1n7llRFq+ZPtf47g/5YF1qmrPC50HIqY2a/XOiqZxE6oYeZTEG6bJ0q8
         Vp9ijS6PhLzetQH/gQwg35RnZn5Gv3QH/7q+1/935UEfjHFJcrXwnP9CFMIeYrtHS2Um
         qUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997194; x=1778601994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MKKxEhH/PG8dHPKGObXTAHe3ka75aRhCwPBKx/xAmY=;
        b=dFKy6aymXQg0wUmGb2zC+C54bggn8zQOfQgEtsnvP6NImxAzBVRLCmqBh/FSbrCSz+
         4e7o80gmsFHqyeHyt15GqenE3krdHBdg8T0wsDCQ5eBD1FG01T2jE2Lu7HnFVUkSJ59H
         JJesY744y0RTe60UDKvL36gTd4NeuBpy3qKr+ydeJkGEBOBkLDs10/F45ECujanU+n9W
         qmlJY+J9nPgBWnk5DLT5n93QQd+uY6jK9r2mYW93ts26xdqF0dRzAhSVoKJL8bZCniLT
         By/3NbQXxO04JSPL7e6s61GbDTOdDZ1kaF5vdwWKPr+A0Z2TjOWIHqnheT3yghTMYuYf
         NBiw==
X-Forwarded-Encrypted: i=1; AFNElJ++e9JIi6yydiKCkOX9slXcCodtgcN0aXjHSHlxWhH9y5NJNO4IEiuv1n/9P2RlWjmqhDguNcDaGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGlPiJ16HqeguCzX1Yhp2BPKsi23VK/V3YpiOI+x+FGCctjwzc
	Cjn0Kxy5m1nnqV/urkm4o4R6sJ3WzTqvounCscJ6I7nYVuLp0ObyDUaf
X-Gm-Gg: AeBDiesJoLzY40h8x17Q4uJsyi6Dl7116FGNoJ3lmJNGT+1riO7EbO0AIg1KEMSPpZP
	Tb5WBl5/Z64+NcZOHQmReQ63wlY6Ni536XQnsEF66m6iaWCjULTmRFOz76g4M3R3Sb9BTkYu8RE
	hk7lJlkGmWVYY/3nJyxjzlDGabPn4sJn0W6KPhoZlsYnUBNcuHWraZus5ZkfxuD5o0sYBsEK2tT
	jzmTMC5VVejPGMHflBodGSzr+4VPtchLm+t24Oy9wO7Li/At7fgfy+KETZlw9TyTb7Zu4qNHlWm
	RFekx9bThUMgxPLlgMgwO90HLK6y1VDY0KSy4er8huAw7BmIxcd/hjkFOSZI8fXXiSHPFlAjrWD
	Il1/BJ+sPbEQWucQC61+ZGKrPRMuelt+RtgO9RL2tHU0Eva4eoRhffRCBznAIPDDeGHQBA5EAG/
	ofOhQdGfZMY/f9EdhURGkBp8rR04N7amaex7Vifhs9Tw9QvRX3UfCbyixaY9wNE8b8zqzEJlJMd
	vJ1FvM=
X-Received: by 2002:a05:600c:a118:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48a9865e188mr184980115e9.14.1777997193775;
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:33 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Tue,  5 May 2026 18:06:20 +0200
Message-ID: <20260505160623.1369347-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 3ba6244952b63..edeeac501fad7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

