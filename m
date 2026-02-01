Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E71B2D877A;
	Sun,  1 Feb 2026 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769923094; cv=none; b=MefHtA8OncJg8beko6ZoEFqwYgKUDLtJbc2mXzm9Gebv3TFd29IkrmTY3fXSJAZkRiuADR4XK0Hevm2BChQpp7d2CHfawnCRLqG8XpqrBTsHzR6rVi4t12uHvlyCBUw5hkjc1UVE7d2S1mCW3ZHg8u7UEvo2n/YMIx7bCxomsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769923094; c=relaxed/simple;
	bh=+kybUpnrtFuQGoWMBCIC3fHFNqt5wBdFD/Eo2b7zfE8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hqRj0iZlJHJLRuTS2PFMw6wns1YMaG5A1c2JNVzN8T19IBhAmeLafI1WjieLAv2fly9nzqGzRmh1v8LPdKqA7J2IuL6oCRt9QMyNK6+VudOc44Iv+nA/NmZwdU03wvScfNKC0C2TmunK0v5oHqcSLtGBdxZfHFvyCQEh+Hx7OQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Npbid27T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Npbid27T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAC6C116C6;
	Sun,  1 Feb 2026 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769923093;
	bh=+kybUpnrtFuQGoWMBCIC3fHFNqt5wBdFD/Eo2b7zfE8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Npbid27TLuRheWz30x8RMRnI8qh8TRjYy3rqMGSvdaKHAg4144DvCku3jAsBRtkN4
	 I08P2T33RIwwsysKE1Y3t65K+MEQUeVptS81TKdP5YyvaCny8f00KO97KCKChhbc9o
	 IEjaIdEc6q1U+P8hCtV6lLh3QTYAZkGCwp9/dom0=
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/7] riscv: dts: spacemit: Define the P1 PMIC
 regulators for OrangePi RV2
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <83affc871efc5fa1c1a08643e66a2dc42b47f24c.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <83affc871efc5fa1c1a08643e66a2dc42b47f24c.1769895215.git.gaohan@iscas.ac.cn>
Date: Sun, 01 Feb 2026 00:18:01 -0500
Message-Id: <176992308158.607015.4408866122835179459@lemur>
X-Mailer: b4 0.15-dev-da43f

On Sun, 01 Feb 2026 05:38:10 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts 
> b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index bd1e45e95e38..f87c6ab417c4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -110,6 +110,116 @@ &i2c8 {
>  	pinctrl-0 = <&i2c8_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin-supply = <&reg_vcc_4v>;
> +

This vin-supply is replaced by per-rail supplies (vin1-supply through
vin6-supply, aldoin-supply, dldoin1-supply, dldoin2-supply) in patch
5/7.  Consider using the final supply properties here directly to avoid
an intermediate state that is immediately superseded.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
