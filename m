Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C5320A00
	for <spacemit@lists.linux.dev>; Sat, 31 Jan 2026 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895519; cv=none; b=U1EWHA0kYWjLkZUU16dbs+Ylf41d+kPn9MnMGpirA8mV2s8HoSLyOMtctURCY0iyr82XZMK0aKx7LqiOvnVVz7QJp/vLYc6vPigYoohtQgnVLWhY//0f/jnPEuBaHP7tmQSA6q+Un4MZODwo34kEKGaeKHe9KPTf2WW7HWyIFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895519; c=relaxed/simple;
	bh=3odlencLpsM7Rn6D1RDjYk/a9U+PLsrfwc0Gj6NN7iY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUHJYJrvrKawKCmPjflM3yttbZHH2WtwsLjzUO0se4UJ60l0JVmDnC35XQVV2gnEvzL/JnQZMnwa9VZV2GqWZaUdGjwF5IlhsK2RtnlmRyZwKErrCZ7PV1Qk5nQMMElCUAX226YHHG4EbM7ru80BTg1AMY/2YmDz1xQvUBxqeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowABXadBIdn5pRJhjBw--.18091S2;
	Sun, 01 Feb 2026 05:38:17 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
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
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
Date: Sun,  1 Feb 2026 05:38:07 +0800
Message-ID: <cover.1769895215.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXadBIdn5pRJhjBw--.18091S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr1fWF1xuFWrWFyftFW5Jrb_yoW8tF43pF
	y7Zws09w1rXw1Iy3y3uwsrJF9YvFnYvrWa9r4UKr48ArnFga17ZFsxtr42yF9xZr4rK3W7
	trs7Aw4xur47XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwwEDGl+GlBjgwAAs+

This patch series enables the PMIC, voltage regulators, usb and pcie
for the OrangePi rv2 board.

Han Gao (7):
  riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
  riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
  riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
  riscv: dts: spacemit: Enable USB3.0 on OrangePi RV2
  riscv: dts: spacemit: Update PMIC supply properties for OrangePi RV2
  riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
  riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 235 ++++++++++++++++++
 1 file changed, 235 insertions(+)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
prerequisite-patch-id: 32d6acfcb4801407e38510b391407943e9a8ec82
prerequisite-patch-id: ae644485e1a8ead3fa7a087c8db9062c7acc14ff
prerequisite-patch-id: 605d537aa0f8387b3523786a875c76b9edfbcbb4
prerequisite-patch-id: faab9c820ac67de42c40f2c4578bb5b8753fcb71
prerequisite-patch-id: f9c4643cc99e5b9f1acc9daf1e679b95f81cee73
prerequisite-patch-id: 50138c8918218ea3b8650999bd558ed6350ed2f2
prerequisite-patch-id: f8f91e32361cc99c531170c39ed54cd1b3c5997d
prerequisite-patch-id: 475d1968c0c41895578809410c9bd8fe24997de4
prerequisite-patch-id: c40f1562f712f04578ef58472840d257a19919fe
prerequisite-patch-id: e9ef3af6c80187e6f05444704d13212d3beaf40a
prerequisite-patch-id: 7076909bb4103588b4761d175eca40bce470230f
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: ba6a7df5c7a2fa9ce0b8a72a9177e42a4dcdab01
prerequisite-patch-id: 33fd23112b55b5e6b1e276594826ee454afc1c7e
prerequisite-patch-id: 009a5aaff0768d90d148eb9d5d999c5098fd6d93
prerequisite-patch-id: 7e41df07cbce163a689f5dca246b98a0122d1610
-- 
2.47.3

