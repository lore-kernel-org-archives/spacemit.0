Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2D29D260
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694668; cv=none; b=rIc3K6yPiI5XZE/sy11jqNMR6mjkpygY8BHuIu0Tfc76NofvceQGzNYcuPOg+hmuVnzPWb92R95A+LWP9wfHQTPKvcYb3JtOoI0OVgAcP3xdDREjs/H3qpISyZxFmVdfOwY/zyh0tdRGePvMf/Mbr0nr/aL188QZrhDWEbBxCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694668; c=relaxed/simple;
	bh=btF1p3wQZL4rW6JxCK9jYb4/9Bc6hNEQFL0xhLFTN+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjcQMaq8Gsl8pDt3atRLQpbsXXKTPp0UihFPSXkxDtCmf/Pq+XJBCwbbcMkDG89S8/kv3ucccE4gzwE4znl6JCM027H/bZQ6JL+Jz1IXqVEaAxsoN8+TvueBElzCOx+tJo0WSNiqMiuy2NYEoxpacy01vBJbbDNBQTGKJve/lmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=lYd2+YJC; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="lYd2+YJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1783694084;
	bh=86FHXPa2XXe0jpQafsCvPbpMnYcFK7y2K3Df68+mJKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lYd2+YJCdkpWfiyt34fYgzav+QBwTBrGQ8g8y14C2NJaYu2FaZgoEvPxcNJVg5CQx
	 SGaIpwkn/Nc3/2cgIpEtIp0dlEVq+ayUjQxo4LYmXeEdIR6gZDLEsupr4gOamtyuvB
	 fwY8snMn84TiVbX7+nOzgR9SImP5eBhsXLhhVmMJbl0FY9hZV9OZaEoSwwFhapeEHV
	 mHLk+kumdOGOwOCOF+OLGdHp/cyRNOp3dYbeCPtKzA9/Xts43s99Kbw1JEJTsQntm9
	 tz9cnPYuWzq3SKmrddGUIpR0L2oQuBerK3yLoMM2FxwufklZ4WJL9+FhorLhktD2rR
	 JOs+ncGQ7qrFQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 42B5FB221FCB;
	Fri, 10 Jul 2026 16:34:43 +0200 (CEST)
Message-ID: <738ce6b8-798b-4689-a0f5-791fe85addbc@freeshell.de>
Date: Fri, 10 Jul 2026 07:34:34 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Yixun Lan <dlan@kernel.org>
Cc: Andrew Rembrandt <kernel@rembrandt.dev>,
 Inochi Amaoto <inochiama@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
 <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
 <20260710022551-GKA106000@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260710022551-GKA106000@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 7/9/26 19:25, Yixun Lan wrote:
> Hi E Shattow,
> 
> On 00:29 Thu 11 Jun     , E Shattow wrote:
>> Hi Andrew,
>>
>> On 6/10/26 02:05, Andrew Rembrandt wrote:
>>> On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
>>>> Do not do this, just leave the rx-internal-delay-ps untouched.
>>>
>>> Sounds good, I'll leave v1 as-is. Many thanks for the review.
>>>
>>> Regards,
>>>
>>> Andrew
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> I do not notice any difference with or without this property present,
>> tested Linux -next with U-Boot modification to devicetree:
>>
>> load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
>> fdt addr $fdt_addr_r
>> fdt resize
>> fdt header get filesize totalsize
>> fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
>> load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
>> # throwaway use of ping is workaround for broken vendor U-Boot
>> ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r
>>
>> Aside, there is still some problem with the driver which does cause it
>> to fail. This can be reproduced by unloading the module and then loading
>> the module; built from -next with 'olddefconfig' of debian Kconfig for
>> kernel 7.1, no patches.
>>
>> # modprobe -r dwmac_spacemit
>> # modprobe dwmac_spacemit
>> [   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
>> PHY (error: -ENODEV)
>>
>> [   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
>> PHY (error: -ENODEV)
>>
> The problem is unrelated to this patch itself, but I can actually confirm here
> 
>> If not reloading the module then I don't see any difference, traffic
>> passes (ping 1.1.1.1) with or without your suggested
>> tx-internal-delay-ps property. Is there a specific test to run to
>> observe expected difference?
>>
> 
> Although I haven't narrowed down to the root cause, but it's kind of
> something wrong with the reset procedure, remove it from phy node will fix
> this issue..
> 
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -232,9 +232,6 @@ mdio {
>                 phy0: phy@1 {
>                         compatible = "ethernet-phy-ieee802.3-c22";
>                         reg = <1>;
> -                       reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> -                       reset-assert-us = <10000>;
> -                       reset-deassert-us = <10000>;
> 
> 

Yes, confirming that workaround (removing nodes as you suggested) is
functional for debian-installer where that reset trouble is being
observed. If there is a patch or discussion later I will follow up then,
also.  On the topic of this ethernet TX timing thread I don't know what
this does? Is there a test situation I may try to know if it is doing
anything? Thanks very much, -E
