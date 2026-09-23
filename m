Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250B743FD18
	for <spacemit@lists.linux.dev>; Wed, 23 Sep 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156121; cv=none; b=UjTd4G0rFBPH88KdxpkLi8XItS8JHkzjajmWOfRPrSf/EsFFH8Fb3zeC+bY4qjKsEkZ16e378G5XjSHaRtFkEkBzOcelYXU+oEK7m2F9fKZ31M2dwX7Gz8xDptJ08+iv453L1BabMkrig/4XCzfdRyjLwQp2hqYyxnIzQfFYn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156121; c=relaxed/simple;
	bh=Tp6ghLSZW6DxaDVewRYtNBOtIgfIO3pF2UzP0xX8XtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoPSEvlQi/vdILdPqGD8PS2nN01H8K0kn9hDcrZDpTLEDntF4HI9ySGBdsZWwe62YnyKNVL85mzQpgjipAKCBOKH3mpYnyasprmz2LTh+pZX+KhjiscIvlaOm9A2uSQCeEDgSIyXnYYnifxL6Psnhi6mwCOMZn5L5F6J3BnkKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4DJFAJq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4DJFAJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A951F00899;
	Wed, 23 Sep 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156118;
	bh=tvDdxkQqQFu9ikiIVUPhKlhxINLnODiVwSWiJxP0CtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z4DJFAJqpTBTQunxgqnZWEf/nKzc3R02W6gdSiXv6tTASpLbH6ekc1aNPau/UDR+i
	 9O5+7LCSlmZkthoXW92qcBxYdRsYEYDzs5VY4VAZBvY7/yhRdx99Ys32WG5XFct65z
	 ZHf6P4uc59La5Y1VRcxgosdDNqng+z8I6X2EyXaUGVIa3Z1wFVUH8MmN7ZYtklVZYs
	 iLmQgirGgthpP+QAk6FbvyYusy/2AFKGDb0GiQNW7uBot2CIAElgk5imnaxGUsvkaJ
	 gIbZNkcqz88nY+BVF/TfjqlDOZaRI7BQS3jLz/HqC7LizHh+hRzlDuR7yc9a+L4FNN
	 fseh/k9KOUFug==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 23 Sep 2026 09:34:29 +0000
Subject: [PATCH v2 6/8] clk: spacemit: k3: add CPU PLL rate tables
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-01-k3-clock-reset-support-v2-6-6ec0abb1c7b5@kernel.org>
References: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
In-Reply-To: <20260923-01-k3-clock-reset-support-v2-0-6ec0abb1c7b5@kernel.org>
To: u-boot@lists.u-boot-project.org
Cc: spacemit@lists.linux.dev, u-boot-spacemit@groups.io, 
 Lukasz Majewski <lukma@denx.de>, Tom Rini <trini@konsulko.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Raymond Mao <raymond.mao@riscstar.com>, 
 Guodong Xu <guodong.xu@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
 Torsten Duwe <duwe@suse.de>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8345; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Tp6ghLSZW6DxaDVewRYtNBOtIgfIO3pF2UzP0xX8XtQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqs502/YYr8Wnp6MuyD3r9LFiETPLYtsrwe/tCH
 IaMqYMRVwiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarOdNhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3Hmw//fB0FPgLNJ4b+oBrm2y81PYXXysQD+OO8LXuiW40l3bqOeydYanrOO
 7Hn1fAL9TPeKs7ZlyMfSOdgBAJ6R+eL7vS5LBJkgHxdGKEg+63KdS0CIePUXHCjKYGNsCxw5PHk
 +RDgNfqVAw2QstHb3649Awsd9NjacNEwIIWXtGlFH2kqxB2J266WzOhIx1UMx5JxJN0SaAymxbE
 r28Xq2JmLtufMTOGPN1OKH5IL8f1SjVkQDTTfjxk78r5BLXDY2W32RTIla66QTUgG3o4Akbf+eY
 EgaSsB0YqzWEcCQY1AtC0SEKD7iIwub4kDqA+8x8TqNLter2RO+YLgfvCz1kdnyhxKKwC6Jf9il
 JhRmPa/wojyB8LAmB0AM+7KSgVQw4f24Bv2Cquyr43Yq8uPedMaKzxO1X5wk+GCL6OnBtEKT+bT
 a1Ku/aPAG22I4a6HCyImccZ+tSCk83Aakkmu+NWwv98RUmaJJroPVv/obIu0expc0Bgsf1N9QoT
 7ZAzRGcE0Zdml169So04jVbccw35iaxU3DYFJovKmv/i5Kngwdg4WnxXvpHJmd2KjEbQFK6Ek/K
 Z55eXeaBEEZPJPcC1vIkeUrLmQI51tapUCGKujtKXeeanwF/ozlxdb/jGGdqh45DhZwI8tdz/W7
 4QMKEZK0kC0ptRqXtGxFjzVyee0OGI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Based on upstream Linux:
  d558af8ee0bb ("clk: spacemit: k3: add CPU PLL rate tables")

The K3 CPU PLL rate tables currently describe only one rate per PLL,
although the hardware supports a wider range.

PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
support rates from 1.05 to 2 GHz. Populate the tables with every
supported rate in 50 MHz steps.

Recent newer vendor FSBL release switch PLL3 and PLL4 to 2 GHz from
2.2 GHz. Since the clock driver does not recognize this setting,
during the probe stage, the PLL clock will treat it as an unknown
configuration and attempts to disable and reconfigure. PLL3 is critical
clock that drives the boot CPU at this point, so disabling it causes
U-Boot to hang while probing the serial console clock.

Add the complete clock tables so that the clock driver recognizes and
preserves the settings established by the FSBL.

Link: https://patch.msgid.link/20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/clk-k3.c | 92 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/clk/spacemit/clk-k3.c b/drivers/clk/spacemit/clk-k3.c
index 1ac64aec6ba..3191654ea72 100644
--- a/drivers/clk/spacemit/clk-k3.c
+++ b/drivers/clk/spacemit/clk-k3.c
@@ -46,14 +46,87 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
+	CCU_PLLA_RATE(2050000000UL, 0x0b2a2d55, 0x00005500, 0xa0558686),
+	CCU_PLLA_RATE(2100000000UL, 0x0b2b3000, 0x00000000, 0xa0558787),
+	CCU_PLLA_RATE(2150000000UL, 0x0b2c32aa, 0x0000ab00, 0xa0558787),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
+	CCU_PLLA_RATE(2250000000UL, 0x0b2e3800, 0x00000000, 0xa0558888),
+	CCU_PLLA_RATE(2300000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0558888),
+	CCU_PLLA_RATE(2350000000UL, 0x0b303d55, 0x00005500, 0xa0558888),
+	CCU_PLLA_RATE(2400000000UL, 0x0b320000, 0x00000000, 0xa0558989),
 };
 
 static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
+	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
+	CCU_PLLA_RATE(2050000000UL, 0x0b2a2d55, 0x00005500, 0xa0558686),
+	CCU_PLLA_RATE(2100000000UL, 0x0b2b3000, 0x00000000, 0xa0558787),
+	CCU_PLLA_RATE(2150000000UL, 0x0b2c32aa, 0x0000ab00, 0xa0558787),
 	CCU_PLLA_RATE(2200000000UL, 0x0b2d3555, 0x00005500, 0xa0558787),
+	CCU_PLLA_RATE(2250000000UL, 0x0b2e3800, 0x00000000, 0xa0558888),
+	CCU_PLLA_RATE(2300000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0558888),
+	CCU_PLLA_RATE(2350000000UL, 0x0b303d55, 0x00005500, 0xa0558888),
+	CCU_PLLA_RATE(2400000000UL, 0x0b320000, 0x00000000, 0xa0558989),
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -66,6 +139,25 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1050000000UL, 0x0b2b3000, 0x00000000, 0xa0458080),
+	CCU_PLLA_RATE(1100000000UL, 0x0b2d3555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1150000000UL, 0x0b2f3aaa, 0x0000ab00, 0xa0458181),
+	CCU_PLLA_RATE(1200000000UL, 0x0b320000, 0x00000000, 0xa0458181),
+	CCU_PLLA_RATE(1250000000UL, 0x0b340555, 0x00005500, 0xa0458181),
+	CCU_PLLA_RATE(1300000000UL, 0x0b360aaa, 0x0000ab00, 0xa0458282),
+	CCU_PLLA_RATE(1350000000UL, 0x0b381000, 0x00000000, 0xa0458282),
+	CCU_PLLA_RATE(1400000000UL, 0x0b3a1555, 0x00005500, 0xa0458282),
+	CCU_PLLA_RATE(1450000000UL, 0x0b3c1aaa, 0x0000ab00, 0xa0458383),
+	CCU_PLLA_RATE(1500000000UL, 0x0b3e2000, 0x00000000, 0xa0458383),
+	CCU_PLLA_RATE(1550000000UL, 0x0b402555, 0x00005500, 0xa0458383),
+	CCU_PLLA_RATE(1600000000UL, 0x0b422aaa, 0x0000ab00, 0xa0458484),
+	CCU_PLLA_RATE(1650000000UL, 0x0b443000, 0x00000000, 0xa0458484),
+	CCU_PLLA_RATE(1700000000UL, 0x0b463555, 0x00005500, 0xa0458484),
+	CCU_PLLA_RATE(1750000000UL, 0x0b483aaa, 0x0000ab00, 0xa0458585),
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
+	CCU_PLLA_RATE(1850000000UL, 0x0b4d0555, 0x00005500, 0xa0458585),
+	CCU_PLLA_RATE(1900000000UL, 0x0b4f0aaa, 0x0000ab00, 0xa0458686),
+	CCU_PLLA_RATE(1950000000UL, 0x0b511000, 0x00000000, 0xa0458686),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

-- 
2.55.0

