Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=135.181.139.185
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806275;
	b=11Rjxh8to1DyPqj7wrXgsxbj8IsCMybcxwuZQzfFcrSpuHPZgsPoFvZ07tJ/BXKjGUC1
	 MkdCF7uTL7QNFItJ/zV896O7kxPUf5LXfMuR6+oe/GLMLeN/5BeDcoABbPmR4/ScXCu14
	 mQeuB5tU4dtP42Q9zWxDmxN4n61AXNmXsz8aS3neoEYA2d8YVLoFzmkRKP/NckVzChuca
	 JjJl2NdPOP7e7SOODb7laQcT/WpzPI/OtuRaCN5pSczv5ThtH4eu/W+DuZCCC3SyVAIt4
	 aZdjNty9hy66jepghRh14UaW11BKE1SdW7j+fD7c5tj0UR68BvNKBAeEgb7rFF2EuLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806275;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=wmQdbKUSq1FmJxZKyQs7/GKJryHhvkYe7uxdRXUT3ysR5Jo71ALwts1Tq4svYdaw6W+E
	 DxDAwrAtD0BCghmCGA9pVozenBCRNskkhJMgyAuc+FzxsW3schnH7C1Qo3AcPPKJiI54C
	 mznDttWi9KhrqFMINDKFFGm9J4FBZ8pZv8jteP/eqwFVyzgXuAh8dBwvn53+j7dRCjDcy
	 2CbROpaX9z4ZR0zzO4bN7tRLA+SQEZ0KziKMoMz3nuU33Cw7la9rOi+767O/4bA5VBuDe
	 N6zFZBG7gFQK9BsP3fw4WD49Zkl+R+jXMLtK2wjF/wcOWdD54iXBVM+g8YMXm+pEUZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=murena.io;
	spf=pass smtp.mailfrom=murena.io;
	dkim=pass header.d=murena.io header.i=@murena.io header.a=rsa-sha256 header.s=mail3 header.b=fvGqEt75;
	arc=pass header.oldest-pass=0 smtp.remote-ip=135.181.139.185
Received: from mail3.ecloud.global (mail3.ecloud.global [135.181.139.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C038606A331
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 15:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C038606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murena.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=murena.io header.i=@murena.io header.a=rsa-sha256 header.s=mail3 header.b=fvGqEt75
Received: from authenticated-user (mail3.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail3.ecloud.global (Postfix) with ESMTPSA id 9C79A892219;
	Wed, 04 Nov 2026 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail3;
	t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=fvGqEt75s9iWkGdzW8PyLgckj9pdrMGkjGvFyZyahqRWPs9QHhig4DERi86GdJV1NnX5pN
	1bIxfn/i6EW0gwi6gU8zIFSI2giGzm7nR4pymGBrVjCMSU+xd6peZmpSehIcs1cUSgKb79
	lPnEOCSFnhHd1crPgsSQsiU2ACzrft8=
ARC-Seal: i=1; a=rsa-sha256; d=murena.io; s=mail3; cv=none; t=1793806267;
	b=vAJtK0uq7OD5cpcDMEr6T2zAIOODrXUui0Fba9wRf1JUKx81ri5QsE2SwcfvwRoZ+9S2aP
	T52/xJyP3aPAqP64AwRoNdwAGBivpgD4FFc49zKk9DRdfzr9n1Nf4tsm9/+FHZCzvADXBA
	2G57Kel3WG/PwQdzJKxbMLl9edo3df8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail3; t=1793806267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcTu78fwRsZ423aZq3ydzdnaGJrAPYdEOB86A5oSNsY=;
	b=BaLGS0dkI31diK5IGJGwMlfhbAoOq9EWfkPdIwLqh368idE9xeuc9QM4cpddJUSjURyl/f
	EZsxZfy7LPL/PgtehfcUMW/79cWCUUZ/3yD4Z2RHDYspbKvMKMPA9YnRrCXQegkWPDjuE3
	ZTb+f/Cw1JqFuKPrn0F0DzKV1aPzUYg=
ARC-Authentication-Results: i=1;
	mail3.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <5f595068-671e-4823-95af-da1702354a16@murena.io>
Date: Wed, 4 Nov 2026 16:31:06 +0100
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
To: sandie.cao@deepcomputing.io
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org,
 spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandie,

> Add the P1 PMIC's regulator topology tree for DeepComputing FML13V05 board
> 
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index b5d5112de358..804abc85602a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -22,6 +22,161 @@ memory@100000000 {
>  		device_type = "memory";
>  		reg = <0x1 0x00000000 0x4 0x00000000>;
>  	};
> +
> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_aux_vcc5v: regulator-aux-vcc5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "AUX_VCC5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	p1@41 {

I believe this should be pmic@41
If it needs a label it could be p1: pmic@41 but the node name should be 
more descriptive.

Kind regards,
Maud
