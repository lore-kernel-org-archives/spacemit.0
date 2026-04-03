Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB615665C;
	Fri,  3 Apr 2026 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225802; cv=none; b=jKJu7BMMRKIfCNN5kGN1qPifmOmXsaK5uwT2X7P9Izei7kUSWU1yony05zc7ImwmL0zP19UGiczwG3MfTUPVWgBxba60Wn++VWirX+id9sku9LHIXTAupxmKzAgm2cDaG1AbAGk6owXHuW8b8HN3MnG69tIr6Oi31kYE6wTO6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225802; c=relaxed/simple;
	bh=esXZWHWyLG1hbgPkvZiDA90BZY2WUDe0Kif7I3Jkhw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThChjwd7Bku5PZbPq3gP6XAg4cz0Z3IDE3EX3N8IBm5pgykot5iXIF/gOSMyodkadk149iSe2KZ1ateXJ9jXi/3BxBYdcByAxogz2He3Hv2DE5gNki7Ig07sco760Qfze+rlwS3lRP5YYY+Mj8DN7vhWAWyH9Xxa/z75+DMfzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IutkozW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IutkozW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD0BC4CEF7;
	Fri,  3 Apr 2026 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775225801;
	bh=esXZWHWyLG1hbgPkvZiDA90BZY2WUDe0Kif7I3Jkhw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IutkozW33xu28g5tZHPr/jssuQ0RSfTxQ+TkgAsanRykcmHI1uhGU9Ro6hc9crnry
	 bCxi7I46rpkV4SHHfFk3ck4VQVjYbjkQdxGy1FygH9QJAKwwntdbqrKTn3fYkn0Ddo
	 1moZGShD2P+6+7EdUXxYI6dBXwfDeThAof7PdPa+8tfI1D+yi3Yybn6ejg3oXPnS4C
	 lviKVQp+nC7h1sN4jD4V4k89vYhz9W2zAQCHE6iYuIZOHn8H4nQ6uYziHLe4qKDbD0
	 pGl7mjdxlTUtHMdy76HT5O64iGFIIjxIfGTyzRnriysFkZrjiZ7qbzU1RvJ7I3RNK1
	 Uq0rUYStEqArQ==
Date: Fri, 3 Apr 2026 22:16:37 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gaohan@iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260403141637-GKA1042809@kernel.org>
References: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
 <20260403095036.231761-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403095036.231761-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 17:50 Fri 03 Apr     , Chukun Pan wrote:
> Hi,
> 
> > +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "pcie_vcc3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> 
> I would like to maintain the same property order as the
> regulator below,
..
> and add vin-supply:
> 
I think Krzysztof will have objection on this, which isn't used by any
device, so not really useful, see similar comment for "reg_dc_in" here
https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/


> ```
> 	pcie_vcc3v3: pcie-vcc3v3 {
please keep "regulator-" prefix, which is
 	pcie_vcc_3v3: regulator-pcie-vcc3v3 {

> 		compatible = "regulator-fixed";
> 		enable-active-high;
> 		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> 		regulator-name = "pcie_vcc3v3";
> 		regulator-min-microvolt = <3300000>;
> 		regulator-max-microvolt = <3300000>;
> 		vin-supply = <&vcc_5v0>;
I'm not sure if there is any enforced rules on this? I can understand you
are trying to sort them in alphabet order.. but I would personally
prefer old way - in slightly logical order.. but I do have no strong
preference..

> 	};
> ```
> 
> > +&pcie1 {
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 
> > +&pcie2 {
> > +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> 
> I think vpcie3v3-supply is not needed here. [1]
You right, can you send a patch to fix the same issue in tree?
I was trying to fix vpcie3v3 warning, but realized not fixed all..

> 
> > +	hub_2_0: hub@1 {
> > +		compatible = "usb5e3,610";
> > +		reg = <0x1>;
> > +		peer-hub = <&hub_3_0>;
> > +		vdd-supply = <&vcc5v0_usb30>;
> 
> vdd-supply = <&vcc_5v0>;
right, I agree
> 
> Please refer to the schematic. [2]
> 
> [1] https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/
> [2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR
> 
> Thanks,
> Chukun

-- 
Yixun Lan (dlan)
