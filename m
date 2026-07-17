Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0E42BC24
	for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299599; cv=none; b=eTO3vxLjgCpDoMMRgwwf7S7l+5Bbqwd76GmIqKR7C0zDU5I3zOSQeERHE2hGPVlzzyatHSiYEh74Jxf/342oRNFujfz6pwhYXRkj2/fI7vh0XjbfhhRSHfiQQkfOWlSzhYf/ENxTIdnrMvK7lCsGl+nXpxN3pojNclxv+LEqErk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299599; c=relaxed/simple;
	bh=ixkgzvll58EwnzL/lGdtgvLL6jYBX9D84ZvdIlb6Ou4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMl4MRKXjO/+8y/j9hvdxix5VUKzZOBZxB/iZFnIg7T5hzjC/AagYSMD1yoy6UBZWPKOiLnbjvT60kIObNTfs+y9PMpcrHr+gTK2DdCCD18iln2W0KRLHpMpDzxeajnat2p55bL92Q9Mh3jVF3UW3Ex4+FFcj5qkiyRpu+IdRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9fJuGMS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9fJuGMS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1831737b3a.1
        for <spacemit@lists.linux.dev>; Fri, 17 Jul 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299597; x=1784904397; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=B9fJuGMSzSj45IUMD3atqBly0cFgEzqBUOawm05M/vF7/ZEspMUr1yuKAdC8T8hrYc
         1KhlChXxz6D5RBBbS4SYrVqQ9EnbpKOlrZuBwVKiEnOXzZZ5X+pguIpK7JAK4fIVgftm
         0EnLrkKEfPNyf1IIqdd459FIOwbWctOy4uWhiR6rao12OVbz/bzaWDH0jggAfvBvtTT5
         zZnP9G4GrYWR6bg9lv5srwQffCmufsb5CXzYL06emfTx9cBG1AHAuaLLY0cTtusABTvh
         TpNcJgxqOOjjzLqazcDUQfPPxW8LxvHBl/rIcJNW4gMhuCj8NEN42U2zqMGOshI3FcWH
         noGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299597; x=1784904397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=SSumu5xZ2RliSXfOZPR3rQLyMhhioOQ3P0chb5vOs1jvkwsJFDfKl5O/i94nibDCPF
         q23a51cO4/vbo+GC44uZiTWqXIkYoMCAWuVyCJBBLqyP28+x8jQlKsTpn+Q2QUrzhYyt
         PmewVumr9ZGAyLZUknp+LhnEkkUqIY8Ex3cDQ5hPkG8bjgVT9pXyDec6M+lSF5aeFfYO
         bQQ0d7KseTIushPbu6RFHOTzrtTcjeNj1wfmbzaagerJSRu5YrWckatseUcGjgFlZI9o
         AX9yGiO/N8gBYq7LUON6Jqj5q3Op410FT+9ldqg9v9zRlGGMMI98HldM30qR1rjdNi7S
         kAFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro9f3bfbVeZH+f/0RWp+k0Yyl9T1VQ5DRxk9o4wt6rQ1ivUUNu3NVop8D9UShpctjbaalw5/lMZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yywpqq1aWKzw5ZUDlIj0Ib1YS6V3RzrLur7F7QVotU0veVq78MC
	6kqPtY/l0/UBwQrqMZXst+Z0ALv3QQfR0Nb/FDADyY+obO/Xbvzr7rq9
X-Gm-Gg: AfdE7cn81icHrVtQRX+9ALMlSiMA+EGsbRg6n+CqeTQlIfw6aHd+Uem3othetBRci0Q
	Z/pqMc6Qr490gg5agTUdSW1q0SNPpaJYxx+k58mEoCkuCpa/mM8IPqjscfmv8r2ARdkQzb7gnoM
	AUJKdDktcgERoVTkVEBPmsERw1abzM4fKpOhkLuapChi1eGV9mZIx5XiiiAQYxtSB7mnD40r34u
	ZVOK9f5jgPk8mynLIMG/cZva8i5rEGBA4/tsoTifN7fjXFl9VIcaBsn+ktto86FrcV1iVgjpuQ/
	HG7Mh99DTEvFI97fO69rAyIHaCuNrA+WSdlkGtinPnC8l5/U+uWt9MLH2NYWDMBYRKcOaCW3fmo
	sSlu2ZkNjizofKLoXpH2bLJJ58KQozuIRjKLk+Jqf50vTiTDKvaO6ArzwzgLnYLj6cYz8sXMPCO
	Hc6zh1nRe/X0gq
X-Received: by 2002:a05:6a00:230a:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84c28c8a48amr2886697b3a.36.1784299596675;
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:26 -0700
Subject: [PATCH 2/4] spi: dt-bindings: spacemit: add K3 SPI compatible
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-2-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=ixkgzvll58EwnzL/lGdtgvLL6jYBX9D84ZvdIlb6Ou4=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAxtUuTQbQ04els6xg0viY3Kav7HvVOquYiR
 Q4CNG1TcMqJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpAMQAKCRDN9pw2gLgN
 2P83EAC+k0C4tFtTKpZdl/bbU4UHfehDpILZLb3mqYViEshXC6KFuG2Ie/4fxrbpY9AK1cpBJgx
 82iMabr/2xwl978GQDFxGQ+wtVvW1AViOr1zZ2JjHvgFEiTlpW3BaRXBHbwsjHWjwlUKa0zc0Ph
 fb5uUzVIfC2vcTi23OWeK9YlXMDA2xFc8OSgIBmFqku/pE24D66o/lPV9OJPbezYWG2zes7Llid
 mS3vtQDDBK+6p/jd+KOoNgtBTOv6VcfwEsh3Aa5JOkCIB+mEkz1W6Y9ZhHLd0E6kU1tjsMmGTxa
 G5nj60HIh6MV63lB6G+F8NFaudyrm52XUXLT/UE/R7w6SZqj6h179FPzeKadiqfP3avoTdjEveY
 DBc8FoUB5/fj574DC9RCZ41p96/y+Jb5EbNF4KfmFXDfxKdGSmlrISuKxO+Cgh/1TvU4U/pEY6E
 CqawX6XhGntvZokXmFsyeeS0lWvbEY2Ag6yDHGxKDojiJEUfOr+FhKxrhH+GJZ8crYdrdlibYOt
 ++WNPhsVQv7Bv7yHMcP9auStsqabwwQqHst3s7pqNSEmzW/r/HZQGxbl0nYVSkGhWBKy0uNhOvI
 SR4LQK3C01mWXERHYdeXJPCO8hjZQOqbjW3y2TyBFpBf2CcU7Ql6HSDBnopyp17qJbPaIFHL5r4
 g9lnxYOY/9d9k5g==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

The K3 SPI controller is compatible with K1, so allow K3 device trees to
use "spacemit,k1-spi" as fallback.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
index e82c7f8d0b98..5d86cc87e4fb 100644
--- a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -24,7 +24,11 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-spi
+    oneOf:
+      - const: spacemit,k1-spi
+      - items:
+          - const: spacemit,k3-spi
+          - const: spacemit,k1-spi
 
   reg:
     maxItems: 1

-- 
2.53.0

