Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4854DAE3
	for <spacemit@lists.linux.dev>; Mon, 31 Aug 2026 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184003; cv=none; b=RI4JPlT/4aAPa/e83j0xRlvOXOX9bwTHSE30JIPJ5HVz39DrTjbRS3TKxwLIRSP3PYTAez6zbKAIYLySXMo0aXg2makTJjIQFid/jCHLGLZmwr5m+0NZhQzxnaihEIJQJIIjgv04Ja+JMY7TBDbQnQVffXbxf3BlJR8z2Vdi5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184003; c=relaxed/simple;
	bh=oPyPhpeTyLPcNCtmwSXuGQluq3E1noUV5NUuvWuVnOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtJl230Nb5lRpbrkLu75v/51O5havuZsqeRfwYYiOYA6HVzW9+LsTf/XhcuC6L6iEnzhrf5Qu7lC4SFmvCVYH1JUeE+i+AP05KJ+fwn36AtTv38pqJa3bLVtPzoSEcesgOg4hMAJSp1Vmhg6JBU+YSVRg3X7Zf0fzcwzIJ1SJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vq91ZEvJ; arc=none smtp.client-ip=95.215.58.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vq91ZEvJ"
X-Envelope-To: spacemit@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=oPyPhpeTyLPcNCtmwSXuGQluq3E1noUV5NUuvWuVnOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183998; v=1; x=1788788798;
 b=vq91ZEvJqYeR8Jz37w+y0mPiL4ITj1nV4BQq2ZczymC8WgP+fyWgR5oax8NuqUkfXHPYrg41
 UWb7KsGnR2dq1TMMIJqyNkrNNuCWc34zMFMHxLL+4m/ZacEzapji/tGBbcvlCrovsUAwXWw94BQ
 yEiPGSK7cvjNgh/0yEhIMd6w=
X-Envelope-To: spacemit@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 78d01d025d72b5ab;
	Mon, 31 Aug 2026 13:46:38 +0000
X-Mizu-Trace-ID: 78d01d025d72b5ab
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:39 +0800
Subject: [PATCH v4 5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ctl2301-v4-5-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=oPyPhpeTyLPcNCtmwSXuGQluq3E1noUV5NUuvWuVnOg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW+e9tQ3Oef/55bOeGYtnC1hm1Lw06r5/06Ug+QeL6
 7O+lUFBHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABMx2sPI0G7wYPdJl7poh42X
 lnBFvcs8rPchyFruW8lz02tbF/zWFWL4H9ab9n7v8YYMzs/+Yc57///uC/BbPqfI+c7rglk3Nxs
 HsAEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

Add the K3 I2C6 pinctrl state used by boards that route I2C6 to pads 7
and 8. Use a 25 mA drive strength, which is supported for both K3 IO
voltage domains, and leave board-specific IO voltage selection to board
files.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 6482d24be139..cb4f4f4e33af 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -101,6 +101,17 @@ i2c2-1-pins {
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

