Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81F3F44C8
	for <spacemit@lists.linux.dev>; Wed,  5 Aug 2026 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921991; cv=none; b=XaxUHOXvpyrdp+ycGPyQsAda0dAme/wxM/ZTSwIOKH2ORGbq7K4Glnbf47YUZUnZLt1ARgT8MyVGoEaD6cFfjJQc1W4kB2dC66V2Mz5LREd2jIhbMNpy0Y18DQNZ6xw7iHMbs+3MXfFo7t/YI1E0aZZDpqv5obkrA1N9bqZ74BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921991; c=relaxed/simple;
	bh=5PcQb4tYPqg14LJCgWYmntExBwf8V8dZAlN+M5P1nEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 In-Reply-To:References; b=c5PTmpWB9jnNPE3yEhwOBFwiUUqFDxTVThcrJKLOLBodpB+Fp5yBAiaN1AxWCPPp4KBjPQw+c6qsYUcKEGxd3zrC6Wrx5R/lqw7gHhLXK9D6MfTupYHK6tErRsOu3AzVDiuiK/MNpQ/Mv4AqFcTJ0TpQYiQ0RiQighEUXShvtbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mmg7s7OU; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mmg7s7OU"
X-Mailbox-Line: From troy.mitchell@linux.dev  Wed Aug  5 02:03:29 2026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785921977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3rrXLP9Gl/9+kZEGTyeSXg9dLTosBnnAR6frYAqGISA=;
	b=mmg7s7OUrs8f++wIQHtt4bS88b+gf2Fb5ZOGsALIL/+YjBk9Q0HDdkbGDBgwRHFoTC4BBE
	Q4wDPhHufV2nJ+03ZfdVuq+RKy0kQKmpHAIK4X77TBbjXx2obMOZERzEQTXmt8msVNketb
	6M7Kh7GC2+tJDy7HLgD2a8McH/2/EQM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 05 Aug 2026 02:00:55 -0700
Subject: [PATCH v3 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ctl2301-v3-5-b86c75d1c552@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=5PcQb4tYPqg14LJCgWYmntExBwf8V8dZAlN+M5P1nEg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFv0/OuPKbp8ltCf9Pr8pPZ+yOhGxRVOe89e2qXGXU6
 3V8H65odJSyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWQIAxenAEzEwpDhn16eQy/n2j0yHLvF
 Xq1XXTG5JeBufIOCj1WacGPNFMNd7Qx/uMU5ervlfkxmudd/9ucMi1+3dl90j2fZtPS5o8hFp72
 r2QA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
In-Reply-To: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
X-Migadu-Flow: FLOW_OUT

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
and 8. Use a 25 mA drive strength, which is supported for both K3 IO
voltage domains, and leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..e50f3e4b5536 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,17 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c6_1_cfg: i2c6-1-cfg {
+		i2c6-1-pins {
+			pinmux = <K3_PADCONF(7, 6)>,	/* i2c6 scl */
+				 <K3_PADCONF(8, 6)>;	/* i2c6 sda */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c8_cfg: i2c8-cfg {
 		i2c8-pins {

-- 
2.55.0

