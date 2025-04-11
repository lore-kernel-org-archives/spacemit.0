Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123A2C3746
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414354; cv=none; b=NQNLmWQ5b8Q3WW1xgrgWFwfH+vcFwqedXUf3dUiWUceSgc5Ldb9df5+gTTVRgcdRfCgsdYTE0uNl6+Fuj/Es6/eulTnDACdNUniz4X3E1e2LiRdIorT2et7rA8utRT0cxrBhDHGZNc4xHgCZEdVepsQwKSwJkqq8JijXdeLEqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414354; c=relaxed/simple;
	bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUr6U3ZZetXlnvPqlVfkJyarG5GC0mI0Z3DXO45YmR21lrYp0x+z3nCYGbA3rNdxas2rRtduUlWcLdN4DDr35pweeutrK0In9INPWepJQkTfg0sHyTo918R9sMRqmek5Yk2pA6NsIS8HIYFJl2DYTUP7tMo7M9RvEnKExKYggwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8BDB934386C;
	Fri, 11 Apr 2025 23:32:25 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:30 +0800
Subject: [PATCH v8 3/5] riscv: defconfig: spacemit: enable gpio support for
 K1 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-03-k1-gpio-v8-3-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KkY5WlJ4z8HcmbXSsfi0mS73OzuDsI8TBtLL7HqJfoc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZrd4vRG6XqpLripBnZDvJyHho8lTGa0XU5G
 HZA+mrwTKKJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mma18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eDRD/4iuneZSWkd1X/wn6
 GSbkkKcY6zd4OMaXi5buW7nsTd4NPDbKfnytVoaHnh3QXf2iqVYD7+R99xxQdGJT0tCS6MuodxB
 rp5IahQFg2jtVGkGmygTkfRpa0pDo+Z4HubQNFt6ER4LplBauRVHgulGA+QzTMcw1cw3dDeyQ4U
 yj+zpxCJE3IEQGhPTye7EmW/2flfO9g/B0/R24FDrZIFh94TG7W0PccMNLUWkbYyfQbCK8QssZc
 7rQxRapwjzK3qzQJLu28S1uR/mKyE0wzg1aGn/pMbXF2hy55SL8B+/9npBhukM4qSV7hiai2VPt
 ayoMScxtyMSZcabMPUd7oaSFTUmD0BXgqPyRNriiPjVF5P5WLxHkSm1u2inWQg3DldCAga4YRdj
 /wZ3W8Iw6o+iBg8vSjFg9BTtbzuZS6xo/d4JmM0sJX/nUqGtaILsOJgML1mLkJ6wkNWmbz48pTl
 BlsPY+sml575pDivZB/uqH3DpZBagnOhRI07EezrfM0ozHXa0+A6BtHCqLLYRwlz7mO7Z2H0nW+
 M0UxIj8Rn7yQu7ogw7p5EqbHizQA+CHyMtgDYN4jyijQ0D7XghOIJGPJz1PZDVjtNyhtC87c7ay
 5bhuEnBSY2xObSECG28XjAvhIS8+24/nyRKCH7vTwly+NkXb16384xCd8MmWvQou7tIw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Enable GPIO support, in order to activate follow-up GPIO LED,
and ethernet reset pin.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e175e0e4c27136c31761127ce6e1602..b8899d59dd345c50d877829c05d0330f2986895c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -169,6 +169,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
+CONFIG_GPIO_SPACEMIT_K1=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y

-- 
2.49.0

