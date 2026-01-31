Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F6366802
	for <spacemit@lists.linux.dev>; Sat, 31 Jan 2026 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895519; cv=none; b=DA5ec2seWdiSE5Z23XJuNL6dc4yAjvI8UCSsydnxH+/noKiPsIp1+pE8GzZEFuHCwsTL1Euk3diuUaDA/NBpACtk0euN2Honkl+6LTMc+5U7wFoKQm/6aFfT0JbljysuWwDJuwIE9tN/AlK11ieO9mBIjlYYCzJScgBCmt4SxRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895519; c=relaxed/simple;
	bh=jpwxRVLKPoVZv9Fo4wEaj2y+VUHAF/4aKGEQRzoJzpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcO+idlpM9d12LxyvU9J2i7t2dw2ac0aZOqAKVfJHQWEK1EYirXuriawAvzPD798qpoFTV61JavzuBqzmMOdQlZ61p+3wCu6Iv/8t97aTaoebtaVnmzlTv4wF+bxaM7ozmP80TiJF9YyPFy44895fZIQj/FckCA/+a9keP7Q0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-03 (Coremail) with SMTP id rQCowABXadBIdn5pRJhjBw--.18091S3;
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
Subject: [PATCH 1/7] riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
Date: Sun,  1 Feb 2026 05:38:08 +0800
Message-ID: <505d0c3db0ca3c471ca0ac4d3c93c9e333b7fc28.1769895215.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXadBIdn5pRJhjBw--.18091S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry5AF4DWFyxCFyDZFyxZrb_yoW3GrX_CF
	13Gay0vFyUGFWvkFnrXr1rtayxu3y5KrWSywnaqr1UGasYgrWrKFWUKF4kJw1rurWYvrW3
	Jw48tFyxJwnIkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfU8XdbUUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCQ4EDGl+GiNkAAABsE

The adapter is used to access the SpacemiT P1 PMIC present in this board.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..93880ba7bdfe 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -87,6 +87,12 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.47.3

