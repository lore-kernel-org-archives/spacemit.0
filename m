Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6E49362C
	for <spacemit@lists.linux.dev>; Tue, 25 Aug 2026 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640626; cv=none; b=c0Wmi4crYj+MgwvAMY1SHCCnJ8kb0ooc2hYlTFvB41cCuSblP6uT28KHNUv31CIi9mqia0XqezeZDMgoptadVevOKwvNf0TFu9PU1Tqg6xa78uEkT67MbMgrZnFsTAnYQP1ATE4XGBLJC/aBNeSZ92LnkM2Uui0ExebqCseaKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640626; c=relaxed/simple;
	bh=liFYWjo242zMAbCe8abHsGm2C9BJg7/NAMJvuUKYy+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bn2k3Lu9VBFqMvkQmeAwU8b0BNxRGX3Li5qxIuXiNsZeh+ZTb/CureUfQ+aFXWy545ukpOtlJzC7pI4Nq2LbD0P52Xnxqx19qfmDX01+FKfQQ9wVpwVYJQP6XBCfnBrTbGekSCsFA6Mmgs0/XZO6Rb9VNrsIlfEOMHcnkYSBkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3ESq2YH; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3ESq2YH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2022323c37so687149766b.0
        for <spacemit@lists.linux.dev>; Mon, 24 Aug 2026 23:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640622; x=1788245422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DHRKCZWzr+4UjNiYIgWaDbN/EmFdXfmYAEs5enyKkY=;
        b=e3ESq2YHDZul7EAMq32kZBi0KvEStX+n5ueimpf8BBU1DG/ZL7a89CtJhFEDadrasK
         QSEKBj+wXvEZtEj7TzX7iolQMn/9i791HpOzKudaupd83zhrLuZN9J70ncBI1I1w+vBs
         SVcv79M59G4AYyfU7daZ49hDBQXdiNUBnQjbmvzeTiGDd+G6sgJjuZoxbQ5FX+xWDj+6
         aExZmskTiht8h8Zx3tJFoNOlUokpeIBwtBqfdELcbsoVy266W/G6HDiczZyJJFnWR5FV
         9TP3DeebG+G27+ugHatVg9LR8V8bRRKgYwayoRsRasdBMB+w6H/kvY6f6StaPecuiQq9
         VzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640622; x=1788245422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DHRKCZWzr+4UjNiYIgWaDbN/EmFdXfmYAEs5enyKkY=;
        b=CP5THesT2ntdAHOBs4TWdMzWUJnB/u3+h8FV0LgeN0mIDfnNgH6f+QrK0RzWWHdPLd
         7L6QdyGaCYnk6lkNOHDiUxOEEHgIV6ZeWa6AVK/vKzu7TUQz2uI80JJ9jUPpjkHGO+7M
         QqWONk6rS42fZ7uJQEE9+a72XvZkbQjtMOxmXK3mFZQtfj7A0WcUu6DH6qPYwUX+k/S0
         Bg0p2nEtJuUBXGfI7FGwa7AaS0QvSm1LSaF7CHDyZPlOf8MQ4pJ/Ccx8Ikg3wdquiZlB
         VAd/YbqHbk6sWmcYt8gKWIIZGj1hk9NrpUn9gqMaWwV9t28IeyO+abOPHRAN0ROb2wdB
         /jpA==
X-Forwarded-Encrypted: i=1; AHgh+RpXnokj3+Od91YUuIdz8PloGE3VfjC3EmEciEJ93YgSoGfywumVPxOinShOxNy1Fe9QfFqxAEyIxw==@lists.linux.dev
X-Gm-Message-State: AFuF++l1dCp3hILuC6prIAfIHraUM+/klJ/MyTBOmIrnttoVJ3FXgQ6A
	oWg2mNLyhSPqHPlriS+m0CY+JzQzfx4ghOxtddjnKSaGKTXOniz++dqk
X-Gm-Gg: AR+sD10BVM/ZYrN1uGOf+m/kvkVdpI8ddhq076CR160/GUAMCPgP03K94kJlSFNsgUp
	1HO9AKX77pNfcA2vKZH5RmvW6KB8DpNyQkSTlZ9NqbIH824RYfjf4upst2VGMz3GIATQK45adpc
	40xpXbLKfHapOMLeb9bHJl9kxwBY+Yl0aacPPmakhcGTuTMWf0DA6Bxx8/D23UVOeWQTp14Xze7
	iNESCHH4Q6ANjOQNioj1qOVc4oKW4YIcgDbfu924abpAp6HGxp2j9pLjcn91WctOf2NxzsUSaCO
	vRRdHeVSJ2z1DM5IkdxJO/cvTgfGa7cHnLNBXFHggxzS56NXSaKYFmKhQEblxBra/9FEnPxoBP+
	ji2Mdzzg58HGtIps9ONyJbG3f804QJ3c/MDB5lZiKE7oP0kxYsi7XnysDTJp/Anq8WiaB7T3qeq
	iDX0Z8a0cjQCcgYjBoZh6B+MBhX3dgqdwwfnMD6DCJH6nnZOfTwvrLd6mGfLto7flDwn9mpt7DT
	w8xujfSovEMBO+Jxo47LE4MZiCgEAKf6xhM533CN9P5ZiKfe3FuMS1OXXusw9zu8A0t
X-Received: by 2002:a17:907:9304:b0:c17:cf99:6154 with SMTP id a640c23a62f3a-c24e5b28879mr442783166b.16.1787640621284;
        Mon, 24 Aug 2026 23:50:21 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:20 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH v2 2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
Date: Tue, 25 Aug 2026 08:50:07 +0200
Message-ID: <20260825065007.69353-3-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY_SPACEMIT_K1_PCIE has "default ARCH_SPACEMIT", but
PHY_SPACEMIT_K1_USB2, directly below it in the same file, does not.
Since the symbol is also absent from arch/riscv/configs/defconfig, a
plain "make defconfig" build for a SpacemiT K1 board ends up with the
USB 2.0 PHY driver disabled.

dwc3-generic-plat needs that PHY, so the result is a kernel with no
working USB at all on boards such as the Milk-V Jupiter, where all four
USB 3.0 type-A ports hang off the single dwc3 controller.

Give it the same default as its sibling.

Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/phy/spacemit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
index cd7ae48d8..b5f36621b 100644
--- a/drivers/phy/spacemit/Kconfig
+++ b/drivers/phy/spacemit/Kconfig
@@ -22,6 +22,7 @@ config PHY_SPACEMIT_K1_USB2
 	depends on USB_COMMON
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default ARCH_SPACEMIT
 	help
 	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
 	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
-- 
2.43.0

