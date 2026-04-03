Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A54386550
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220719; cv=none; b=RQaXYr7/t/SBRZfUMKlWVgjyb6JK4yqaT63bjkf9o9KYYX4GCksy0ZAjeDBRJVLL00paMcMGR3qklWzDCLYThmurglVuh3NV6ZvO8IGY6S6imfLpvfMDS25YSE0+SJ8VKqoY5I3FRVLpsycCHq9zNz4rl7BxmxZnCyvD+sgqOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220719; c=relaxed/simple;
	bh=b/XPKacYDEBFZA4oQX9Cg4g3j+4OwBwxZ0HpcaZUm9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnP4VM0GoEhHGVFcRCol7I3UuyLGUL1hWUVDAznPn42zXQ0a3BQjfD6p8aI8PcDx9sgqbgHivnjEABlOVo/3h0eaW+cX2KzmwNSW8WgShacPowDIVwG049ZPSyVA/wiMi2waurfq6edpRP3wbzOCn5OI8lGixkGGjxbBs5N/2/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowABnDWnlt89pEvwRDA--.20275S2;
	Fri, 03 Apr 2026 20:51:50 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v8 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Fri,  3 Apr 2026 20:51:45 +0800
Message-ID: <cover.1775220547.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnDWnlt89pEvwRDA--.20275S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFykKF1DtF4DXF4kurWfZrb_yoW5Xr4fpr
	y29r43uw45Xw42ya93uws8Gr1agF1rAr9agr1jgw18ArnFgay7Za1xtr47Zr98Zr45KFsr
	trs7Ar4xur47ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAcGDGnPqxAVHwACsU

Changes in v7:
 - patch 3:
   rename usb_dwc3 from vdd-supply to vbus-supply
 - Link to v7: https://lore.kernel.org/linux-riscv/cover.1775219669.git.gaohan@iscas.ac.cn

Changes in v6:
 - patch 1:
   reorder i2c8
 - patch 3:
   restore vcc5v0_usb30
   remove vin-supply from pcie_vcc3v3
   restore vpcie3v3-supply from pcie2
   update hub vdd-supply
 - Link to v6: https://lore.kernel.org/linux-riscv/cover.1775214644.git.gaohan@iscas.ac.cn/

Changes in v5:
 - patch 2:
   restore floating nodes and mark as 'not connected'
 - patch 3:
   remove vcc5v0_usb30
   reorder pcie_vcc3v3 and add vin-supply
   remove redundant vpcie3v3-supply from pcie2
   update hub vdd-supply based on Chukun's patch
 - Link to v5: https://lore.kernel.org/linux-riscv/cover.1775148159.git.gaohan@iscas.ac.cn/

Han Gao (3):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 218 ++++++++++++++++++
 1 file changed, 218 insertions(+)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
prerequisite-patch-id: ef6e9c7b5854d0c08066b72f9a7868db8c2140eb
prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
prerequisite-patch-id: b76493e625ae257c8adcd67874178458420e4d47
prerequisite-patch-id: 88e01dc92c83bd88ddeb78891d3088209fed8d6b
prerequisite-patch-id: 60336d10ab8322c70596d0f046b6b5c54bb24b54
prerequisite-patch-id: 68c4d869548687dc115dd91e2ffb8f4c11482d86
prerequisite-patch-id: fdadcf964c2cb3406160edb579d99a8d5695f8e6
prerequisite-patch-id: 73b9e745338b0499b849fa4f7f9508987ab39a59
prerequisite-patch-id: cd26770c2160c3c31a406bd8a6b01ab666180ae0
prerequisite-patch-id: e5dfddc32cefae195692da8b80e19adf086e4ad7
prerequisite-patch-id: 7fd53cbe4977598f26148a4bb1cf692bbdb79a09
prerequisite-patch-id: 96ebac57bb29619b97fe95422206a685825618e9
prerequisite-patch-id: 00fac16b52f60383db3140e2885f3f7f8d14dd1a
prerequisite-patch-id: 3b7a60047b922c48e93599f621cb738856f42354
prerequisite-patch-id: 275c030b963be05dd1041451f539a130ce614277
prerequisite-patch-id: 93963424b0871e64276af0e0b2199b52e29b4603
prerequisite-patch-id: 8383188b1c01ed6280629faaa29c37d699ade241
prerequisite-patch-id: 5f8126b912b924d63d4a1e0c5eb42d212eb0d369
prerequisite-patch-id: e80af628a2e0b5f2eeb3cb1b5e7133d08bdd2c4e
prerequisite-patch-id: 0234a6dca15eb91f98a45a46604ce5b4935048a5
-- 
2.47.3

