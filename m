Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545ED3148DA
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214828; cv=none; b=IaZM7U0jo8TS0zRznyPcMlNCk6Cy2HQeMSQnxRyNf3URA3ollDTtyOH3JkzGV+uDThKRvvS0DvRetn19AxX4oKtmNvwlsKqRgTt/gVVQR314QKHI5x2N55FmLebDGb+s2EkZMcQtT0H0EhT2TUyE4E6QpfNi2WzUacXV5xQnXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214828; c=relaxed/simple;
	bh=yKGwax2WD4RCYL/hbe0moTrX5dM2YM4xR0xYeDlO7I0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DdQr6PGLf2JQMtIW6x/H/Y552vWo31A/flnJWtNQ0zZNpsF8kw725e6cXr2bIYPw6FsSxllcArNr0boxWT0rq/4DtrOsgaJBEKgDbGfbJzfyQpU7GDgoivDAljZN7RFW1Wj6rd2cvMti2EXyK/dBcyEOyfJIp3hcx//wt3B7RkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDucM0f5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDucM0f5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E5A1F000FF;
	Thu, 24 Sep 2026 01:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790214826;
	bh=BxFGRAsaEEEYuTeA+EjwH/PXfqCgBQ+HlJ1KuFKp9G8=;
	h=From:Subject:Date:To:Cc;
	b=jDucM0f5oqdESLR6Fu4G7u6lKJEVvklT2qDLWZfG9ncU8LrSDdBz/f3Vq6PLSqZtT
	 /CiotjDaN0R1ijX8El55rPrbZFHBW4Cx6c7yyDiSvLig/PllIoZ/074yfh1982koa6
	 uLpLsiodduCy44ICn+PNiWSQZuojUsa3/HWLo8gcrdOCNbRxPTwdaIdo7E1j4ny7Lc
	 EsdWA4Cp8Li6JxTgfEKvSXfgXSFsa2NpE+LV6QYznn+GFyIoTSJ2XAfNZ0DhICT8kg
	 fpZv10aVVz4nqRrlSfcAf2qV+zusF/hqlP51ewzqfQI1EiG8kAXMX3lX9cHQHzrrdq
	 fWqP2eAbty6QQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] riscv: spacemit: add ethernet support for K3 SoC
Date: Thu, 24 Sep 2026 01:53:28 +0000
Message-Id: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORvoUnHOV5EdXBtdFLqSdDIYe
 3erHr/D/29grMIGl2YD5beYzKmiPTQQplt6MEqsBnJ0cmfy6AhfHrlMrIkL2pLzrAV9Hzvq2y4
 eKUCNs/Jd1t/4Ovxty/jkUL432PcPtfLbt3oAAAA=
X-Change-ID: 20260823-02-k3-ethernet-support-39d72917d42c
To: u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, 
 Jerome Forissier <jerome.forissier@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Peter Robinson <pbrobinson@gmail.com>, Johan Jonker <jbx6244@gmail.com>, 
 Julien Stephan <jstephan@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=dlan@kernel.org;
 h=from:subject:message-id; bh=yKGwax2WD4RCYL/hbe0moTrX5dM2YM4xR0xYeDlO7I0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqtIKen4tkq9zz8LdM1zVhkVX3fil8T0+Kb/3Ot
 kS69it0x8OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarSCnhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0BQA/+PzTuG4qchEXf83X8mYYvJ1WRivrH+fVtcnAbwckD983x2uhjxEpI/
 GuG1TFO5e8+xgKeBAwhukE032qYbofcTedl8wpY+6K7Uxc7b5cWXvei1NdCowOKbbTOawIJKAqR
 VJ8dkYIBHXNuRg6x6SZeIEj2OPFJHNPm2ksZl8sexBg214ZFQa5N6As5FUtWX+EZRf/bA2i8n/y
 1BlMTNGYWr/WutgWajDJxGdAWoUtS3FlFrozJxaJo5SgJ7SuN9jX3pSPYeNqCPhcbXx5jFdUdri
 Mv21jw4BH4zR+ZaRjaYg93dl8RnaIiLQXHWd3wMlGdnt7p7beyLKOaskOiqRw4ofVcO1rPP7eBA
 INtzThJqIuj7LjVl6TUh0aPmOASGPaYPzCHR40ZXY6D2N+v39R8Ylh2CA05+26E8Fje3l1GzGuf
 SC11wTmQfMDDCmDjngcNdIAIyrdCZS+QsMtHgImm2kAgBTmP4iPoNu5weGZW6RwHSpoTBcaZ7pC
 z26z1aAAxynsRjdWflVx00chWNto7BRvLU3ftzVEpXVnn9dFDUxcgXP4ffoq9BGWOW5iUsEsP41
 dbHcnkmbzDZNwzaIIdc6Jy9n2UbEV/gyFl5wViKvlvViG6UMQEVlUDppXZo5xjpgZFlg/eBc+uv
 QCXJbtXoW2GgRwpPsvrv0RElOAkHAM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series try to add a Synopsys DWMAC glue driver for SpacemiT
K3 SoC, and also enable ethernet support in the defconfig file.

Tested on K3 Pico-ITX board with command of dhcp, ping, tftpboot.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      net: dwc_eth_qos: spacemit: add support for K3 SoC
      configs: spacemit: k3: Enable Ethernet support

 configs/spacemit_k3_defconfig      |  10 ++
 drivers/net/Kconfig                |   8 +
 drivers/net/Makefile               |   1 +
 drivers/net/dwc_eth_qos.c          |   6 +
 drivers/net/dwc_eth_qos.h          |   1 +
 drivers/net/dwc_eth_qos_spacemit.c | 313 +++++++++++++++++++++++++++++++++++++
 6 files changed, 339 insertions(+)
---
base-commit: eddb50614effc8763a05088196fb07490637e04a
change-id: 20260823-02-k3-ethernet-support-39d72917d42c

Best regards,
--  
Yixun Lan <dlan@kernel.org>

