Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3262C11DC
	for <spacemit@lists.linux.dev>; Tue,  2 Sep 2025 12:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816049; cv=none; b=Fu+rSzv3S0TpJT3oU7aWBxWtunKde9wr/OLr7W+nsAMDu8WPEVYCt8eh+rG7ofmSfDTQ1cNhdW25SXSoLb2aGYRenzPPuMstEA5rSITRZ0v/aPf5cWzRmfGnOv4H73Hn0M6oQ9r5PKyt+RlXhGVYUZ7DOXViE/PK761GdwbPIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816049; c=relaxed/simple;
	bh=moNuE2PRSa0VOYC0+NmKIqSBqUotBU26lZOsdMAaqiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QDwQcIx8a+yPThdCiyKDR3koNfJ0qDOE0QN4upPjkGzEb8x/ENpcfrbXMrSs/FvLFJCpZGn7iPOD3zBrTRzdwUqBjsZ0luqH8jpqx8lsADWiN6p8yjt9Ku4F7WrDVDT1NOj2JACqvL0tsK7b1K9IA+LmtoQ/hqWcydk0c2HXp3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D8E4F3408F0;
	Tue, 02 Sep 2025 12:27:22 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 02 Sep 2025 20:26:58 +0800
Subject: [PATCH v2] riscv: dts: spacemit: uart: remove sec_uart1 device
 node
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-02-k1-uart-clock-v2-1-f146918d44f6@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAJHitmgC/32NQQ6CMBBFr0Jm7ZhOo7a48h6GRcGhNBiGtJVoC
 He3cgCX7yX//RUSx8AJrtUKkZeQgkwF9KGCbnCTZwyPwqCVPitDFpXGkfDlYsbuKd2IquW25p5
 UzwrKbI7ch/eevDeFh5CyxM/+sNDP/okthISX2rK1J+cMmZvnKYscJXpotm37AlAzF0OxAAAA
X-Change-ID: 20250718-02-k1-uart-clock-0beb9ef10fe0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=moNuE2PRSa0VOYC0+NmKIqSBqUotBU26lZOsdMAaqiU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBotuKnh7sGv+ULWyGalREl83uFZAXlNGwzlBtHB
 u/qrvncND+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaLbip18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SfYD/0Xisz07nPm6GOmWU
 iXPneJjpAPADkmpIhwBkBn4Ey7DtRufKtK4jnZDtAQ2C7CEnPResJ3d+FzXf3TutIfAmmYwAm6F
 msmovcYACCclKjPuHLnQP8j/e2ylroGqPnCGs5PeFo/kYgnz3AdGBTaikS+XcBEYSAReFUrn5/W
 e7yTJJuBWd/4rqqe11gUMQ7fpta5vtbERkn/rs5EXnpqEpWG12w8ERFT7qKj5Rmf8ilIUVEjRbc
 1efbpuVyiQpilqyPBmfwHxTxJNmfnAgJrCNC5xDnxAsqNFCAjXRZqxOWzcg1VryGoW1Grc2zE6H
 Gk5XH2+AwWmfgmA5cwfPSCgmaTaNh8M72VPPq1ZocowDlYyekfoamfKWdEuEC7+z04mB1dT5zQx
 3N4q45D8dXp2rFDikQ/2bT6P85o9Y7gJRSt6x73V3GVRcX6v6paYqxcuhj6EzemlctROdI7s/tg
 YWp4NU9C/swS7PCg+FPluEw5IB0IIEpt59yOPFwo4AcMgI9RZSDmMmkvUMTbS9oPFateEpEsg2r
 XIFDrDpzRlL5wVwA1KuLqSLNFzUp+3w0uwFf2DsZCl+2EVB8MvwJXLZ2+umwv0thXCBYBl1/zwy
 Ne3JVLS/uKHuPU2VSZgCsToiyRSq3JMGxcD2ITzG33pzpW7QAb9xbWh2iuzUoSXRpvog==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

sec_uart1 is not available from Linux, and no clock is implemented in
CCF framework, thus 'make dtbs_check' will pop up this warning message:

  serial@f0612000: 'clock-names' is a required property

Removing the node from device tree to silence the DT check warning.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This patch try to resolve the DT check warning due to
the clock for sec_uart1 is not implemented.
---
Changes in v2:
- remove sec_uart1 node instead of marking it as reserved
- Link to v1: https://lore.kernel.org/r/20250718-02-k1-uart-clock-v1-1-698e884aa717@gentoo.org
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..3094f75ed13badfc3db333be2b3195c61f57fddf 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -777,16 +777,7 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
-			sec_uart1: serial@f0612000 {
-				compatible = "spacemit,k1-uart",
-					     "intel,xscale-uart";
-				reg = <0x0 0xf0612000 0x0 0x100>;
-				interrupts = <43>;
-				clock-frequency = <14857000>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-				status = "reserved"; /* for TEE usage */
-			};
+			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
 		multimedia-bus {

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250718-02-k1-uart-clock-0beb9ef10fe0

Best regards,
-- 
Yixun Lan

