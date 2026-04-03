Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8A2153D8
	for <spacemit@lists.linux.dev>; Fri,  3 Apr 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216074; cv=none; b=rAt6Xane+gXc2CWpqHiGIHB+KZdhD8sIX1fbPaB2NXAf6Dw/GZEEkmc+vOPOm35yzNzS5uyIlx7Q59ed3nquAnBjmzaTAqqIeuMbeXca+nCAGZVVoVSyLXeRSvT0FZXnwFZH3vgDRB2ndGhHZcCheQazeR8186+so7y/yuiM1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216074; c=relaxed/simple;
	bh=JQuv7TJhUby0B2DbFEwjJ2GgRpdVrmAWRgSs6sdODig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZIgKwUXsVcZC35Isyi5y8yf9lKpsEnfdaGABhKHyqO9Ks2YmVdkDWv0eOjcDoMGigAXDfAz2rYfhuw6oIA3OfFfPlGu/Yd8fIbFItIcX1R3+Mu4qSj7AjjcVjDG/HUXJO4v8II7p3vHMIkbOTMuPnFOxZYzIuOfuZRhz9oqMfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NBMmxTlt; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NBMmxTlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775216066;
	bh=qTZo8nQRqyXJC45xEJKxaXlFAAHI9lvwc+YRV5C2fcI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NBMmxTltCjXlk2X9w8WwvgLOL2m+Z1knYpW17YmNKu165TVTy5K+8s+wfrz9sALuQ
	 h3cDC0Yv8mZ5C//OANZmWisd6hHv+NR7EKdzhZlkczTOUb8JSuQizgnrzeWvx67vDr
	 MQ14FENvd96mn4ERzBMpwQFhyxNWipVqkznmajk4=
X-QQ-mid: zesmtpsz8t1775216064t10693d8c
X-QQ-Originating-IP: 7rXuvyvFl5r48MADo60XkrDDRRv3xNc7tT1AJ8HW8O4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Apr 2026 19:34:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14934306479577583087
EX-QQ-RecipientCnt: 16
Date: Fri, 3 Apr 2026 19:34:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 1/3] riscv: dts: spacemit: Enable i2c8 adapter for
 OrangePi RV2
Message-ID: <5007945F00CD8DE5+ac-lvrEHGuGIZC3b@kernel.org>
References: <cover.1775214644.git.gaohan@iscas.ac.cn>
 <894c94e9d087c6a924146bda9a5649c424de320b.1775214644.git.gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <894c94e9d087c6a924146bda9a5649c424de320b.1775214644.git.gaohan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M4lPCacZ9YleQ5/vhpHc50lkbE+vLvElrtsxG7sFBuwG6Kz9afegwb0x
	wMzjiO+mjSoxG2mmaqV4xQPT2GQDH3iMPM2OKeaH8W9nGgn7BodBnSb9qpEiNTomVzjSpKt
	nKqqU3suJy14sLlG7Q8KjQnBb+6/RjOtpu4OQsaKOPLlyPHY8nELoo4pOSsI+ApYNIrfuIn
	N5LEf34Y5irzlDvydHbooAWLkzVW6IXOlhiI7rvtlQzLYcQSff8ANbtR30xUtGUxgku2XmA
	9xom9FiGH1d1SCNhXTQOIwowweSHv6dVQ/XDg77P4FpQmSsHrp1+uagKzW7Byhlf0/8Bkm+
	m1RubHTPwFK6wpL0bK2tH1C81B3SQXm3d3M0BGVkEt6BlrSjHe/AjKTU7nWcVVcm7QzAMq0
	E3ickdzzHUGO05pmYjul71PdEHtE+3y9741rrg7d10zdM39GI+i6Cpjs5rV6yK4FzHPoIme
	IJkq350YhzDP8Kg+mhO85nveV7IIdjGT1f+e0h6CeaE9Pd0aN+r3X4G1ZYr/Nv+ksAql4Y0
	CWdthcw1qWj4lgupjKZM/2RZLZgxVm+OV4U3s2uAXHwWxpybF4EcSPMSqD8GCrLGJH+LHeU
	/wQ6K5FYX0PgKRTF2fvdA+7Db5a1+X3XcaqsQa+LjmZhtVaui7StFeB6k72Y7rhYPcBv1kR
	+SPEpSzuNAlkxEIUx/aaKPepRsJhkTUx/ycrserDjHyZZ8cWrzuBPk4C4q9Hjn+eNjtz87z
	enjxe89qd+wjJ9cb0vLouZUnHps7pQHkiMkOQ6JC52usWLOfOQwZjH4rN4EOPlDbFdUqD+g
	P+saf5MHt1KaOSNd60LFtqfkuZfsBB3oj/ENcCmM9TMsOFkjQcJQMwUpDIhKr9SMpyRvpHE
	elFWCNu05NjOAA0uPjlpo4XzeitDRTpI1IHkX7tdNbCElXqC2nt/SDnZjboRm6B8b31PLFF
	up7wBhPtnY3HAils3LyICQgU+5UTVPnqlLsRaRK2zigBUP1QlKnQ/91CNb7PfERz2qkLkgD
	q9Fz7Gv6pAfqsIxx8hc6V3OPGaGn6ZTmYNNjpCi10+B0TCmDDXkzb2UFOrC2A=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Fri, Apr 03, 2026 at 19:18:21 CST, Han Gao wrote:
> The adapter is used to access the SpacemiT P1 PMIC present in this board.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c72..93880ba7bdfe 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -87,6 +87,12 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
Please keep pinctrl-names before pinctrl-0 to maintain consistency with the rest of the file.

                                              - Troy
