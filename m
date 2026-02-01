Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47B2DA768;
	Sun,  1 Feb 2026 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769923095; cv=none; b=gj3FzJtcV7bYIR1PwySjHDdwUmnI1PiRxhbcSxE0p1SlioqiWPUilkyYh2bfPIQRGbIEJ6XTB3JJNJZ4VxiPKKkQgV0GpV1nE8489YQof1ujc9zGBQa0HnrXQYTD7TxykYF3QC1CUllGI+QIH+B5YifvjRiSlXy68YmOIRWdvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769923095; c=relaxed/simple;
	bh=1le60W0oigdWByY/8TD5ojipz7cEh6LqP0syr4z+JTo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=slVwPzMFNRDNpRLIwoR/LThaIAXNFxM5EUCAkXrM/eAdkkVqPjjKtOplyISVtvBhi6l4aH01AizcjLb5ajmyPdSTk4+TzVUXRAu8wVCsKlxlDLzpDj2vI4qQ87lM3+a8nr39k/UXVh6Wc7oQqPMpnznNycZp9OFPYZr/CyWDXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nxpw8i57; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nxpw8i57"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1186C19425;
	Sun,  1 Feb 2026 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769923095;
	bh=1le60W0oigdWByY/8TD5ojipz7cEh6LqP0syr4z+JTo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Nxpw8i57i+vomNkiGk7QHu0zC+/5rO+7z96KI0B/h8rGqcyWlUMPYDn8VcXtldeM3
	 rQ8wvzRfo8+veCVX3nFKD2f28+fBpld4fXAHTK+3sm3Mqnpibg+rMUj6qrtZiwPDo/
	 QQVCjCBpW83EAKpKe/6P12FJ+ujtAqQYW9B0pS4k=
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/7] riscv: dts: spacemit: Update PMIC supply
 properties for OrangePi RV2
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <485bf9935397707158529bb7c0eec6cb20ffbcc3.1769895215.git.gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <485bf9935397707158529bb7c0eec6cb20ffbcc3.1769895215.git.gaohan@iscas.ac.cn>
Date: Sun, 01 Feb 2026 00:18:01 -0500
Message-Id: <176992308158.607015.980372835663972481@lemur>
X-Mailer: b4 0.15-dev-da43f

On Sun, 01 Feb 2026 05:38:12 +0800, Han Gao <gaohan@iscas.ac.cn> wrote:
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts 
> b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index d8d0baaec731..c0a0c96f2ac4 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -134,7 +134,15 @@ pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
>  		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;

These per-rail supply properties (vin1-supply through dldoin2-supply)
are not declared in the spacemit,p1.yaml binding, which only has
vin-supply.  With unevaluatedProperties: false on the PMIC node, these
will cause dtbs_check failures.  The binding needs to be updated to
match, or these should remain as the single vin-supply.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
