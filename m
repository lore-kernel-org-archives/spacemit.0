Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBA22D73B6
	for <spacemit@lists.linux.dev>; Sun,  5 Apr 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417484; cv=none; b=G6mSBmoxmOHSOPe1yIY3UaUnpELWopwGec3AqzbLRVVA0IuTrxvzTsriaQRFHWVmbFeCTkPzwVBcAXHM7UDvvQuFhWkusK+w5W3O4ansUyCcwAUretFfEPvCuaqpy9mxAjjRd7+vkLd0yux/Whf5V/stfn8DXi5cSi3TKK7oOfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417484; c=relaxed/simple;
	bh=2dVl60hE7BeqeGzYbWqK1g4D9jJ/S/AdvJuWwlKqYIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aO1HRNGRe4tPP97wqHsQ4oJYrVTgGOaXRzUBF+6Wh5r7H5tV/KFwrh84nGOFMGea/qw926uQE77aSNzdL9rwE/APYu3qqdfdow0ywQ7g0uo9t/hNbu3SKHQazypyoD/6KoLFRLrYDlJehvV+/LdrTxCNc6ObR2+ZeMv6cuHM0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-05 (Coremail) with SMTP id zQCowADnfBB3uNJpOkKeDA--.25923S2;
	Mon, 06 Apr 2026 03:31:04 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Vincent Legoll <legoll@online.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v9 0/3] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Mon,  6 Apr 2026 03:30:40 +0800
Message-ID: <cover.1775417019.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnfBB3uNJpOkKeDA--.25923S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1kXF4DJw17uF48uw4fuFg_yoW8urW8pr
	y2vr45Zw4rXw42y393u39xJryY9Fn5Ar9xWr1UKw18ArnFgay7Za1xtr42vF9xur45tFnr
	trs7Aw4xuw4xAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAgIDGnSelYyaAAAsN

Changes in v8:
 - Collected Tested-by from Vincent Legoll
 - patch 3:
   remove vpcie3v3-supply form pcie2
 - Link to v8: https://lore.kernel.org/linux-riscv/cover.1775220547.git.gaohan@iscas.ac.cn/

Han Gao (3):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 217 ++++++++++++++++++
 1 file changed, 217 insertions(+)


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

