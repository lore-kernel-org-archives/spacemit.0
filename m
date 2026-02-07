Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6328D26E6F9;
	Sat,  7 Feb 2026 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471905; cv=none; b=tf5brWJlGNF055xzrxB7IkJYin37VdkF0ODkLHLLcKUtTm5p8+PXQa2feNTMxxcXSymPGPuJg3gUglfcNLOBbLfM2yx4izeu1nNbLwWhFEKbeNLh1npVFo1YmiCWdkdi9CH3pHqGm5w0wWzrKOhspr8g4DvpXc09Nf33kjGHcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471905; c=relaxed/simple;
	bh=Fcg7QBGlOtQbed/3P4oI5lcao5EQQ/HrCDZfMumyuCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgwodSM1FMJOLLqhy/X/LEGgnpEgxzsEp7z+E+RtBY5Teg7wuUXg33MGImuWDpXaqhIxRbWQt266KpALIjKGmQSQYhd3GNmZ4KJT2sMz/Ajq7Pz54YixsyxQymtbhBBvgl+EH19P70QsEsQp80W7ON9jt+QAfC8cULmZ2CUwDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qbn1qHc6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qbn1qHc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F835C116D0;
	Sat,  7 Feb 2026 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770471904;
	bh=Fcg7QBGlOtQbed/3P4oI5lcao5EQQ/HrCDZfMumyuCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qbn1qHc6lUrKbMPzzgWKq9vZPEJ5bUGVPedLhLKD8PPzQnk0mdZH17CAxFkqIDSyr
	 Q86aVZWIWFBugvb4g7P1TqzbBJKV/gd0c8h607JUgZeQry/qJdcUWVcGTyOvq0JQur
	 KEjV1Hm3ercnG7hQFageEvR0B2ADXlDs52EcThKNZ556SZRyhCy48SfbQ1uO56ScL0
	 Xww7xd1BYxMFIy6A47C/k8zgIMbjhsiQS5/kWiqu6ScnAGSdcH+PajhipN398yjiZp
	 Q5mZHckqvj/BHfQl0i+THKnyD24AnFcuVEppEaZc/A8wgegLmwynzeDfd6F0gu1tYF
	 Cnav442jy+/Fg==
Message-ID: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
Date: Sat, 7 Feb 2026 14:44:59 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to
 K1 USB2 PHY
To: Ze Huang <huang.ze@linux.dev>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
 <20260207-dancing-finch-of-chemistry-f98cf2@quoll>
 <DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2026 13:30, Ze Huang wrote:
> On Sat Feb 7, 2026 at 6:48 PM CST, Krzysztof Kozlowski wrote:
>> On Fri, Feb 06, 2026 at 06:00:08PM +0800, Chukun Pan wrote:
>>> Add an optional phy-supply property to describe the regulator
>>> supplying for USB VBUS.
>>
>> Why wasn't it there before? USB did not have VBUS?
> 
> Previously, the VBUS regulator was defined as regulator-always-on in
> the device tree as a workaround.

Bindings are supposed to be complete regardless what driver does (or
does not).

You must list all supplies with proper names.

If this regulator was missing, then what else?

> 
>>
>> Explanation is so incomplete I suspect you are patching broken things,
>> so as well this could be completely different hardware (e.g. there is no
>> regulator for this block but e.g. connector).
>>
> 
> usb ports under usb hub node can describe the topology well, but
> still regulator always-on is necessary as no driver toggles it.
> 
>     usb3 {
>      dr_mode = "host";
>      #address-cells = <1>;
>      #size-cells = <0>;
>      status = "okay";
> 
>      hub_2_0: hub@1 {
>       compatible = "usb2109,2817";
>       reg = <0x1>;
>       #address-cells = <1>;
>       #size-cells = <0>;
>       vdd-supply = <&usb3_vhub>;
>       peer-hub = <&hub_3_0>;
>       reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> 
>       port@1 {
>        reg = <1>;
>        vbus-supply = <&usb3_vbus>;
>       };
> 
>       port@2 {
>        reg = <2>;
>        vbus-supply = <&usb3_vbus>;
>       };
> 
>       ...
> 
>       hub_3_0: hub@2 {
>         ...
>       };
>     };
> 
> Here is the diagram for the USB2, USB3 controller on K1 Jupiter board [1] (page 21)
> 
>     +-----------------------+
>     |        K1 SoC         |
>     |                       |
>     |  +-----------------+  |   (USB 3.0)
>     |  | USB3 Controller |--|---------------------------------->+--------------------------+
>     |  +-----------------+  |                                   |        VL817 Hub         |
>     |                       |                                   |                          |---> [USB3 Ports]
>     |      HUB_PWREN        |                                   | +----------------------+ |     ^
>     |       (GPIO)  --------|---------------------------------->| | Enable Chip Power    | |     |
>     |                       |                                   | +----------------------+ |     |
>     |                       |                                   +--------------------------+     |
>     |      USB3_PWREN       |                                                                    |
>     |       (GPIO)   -------|----------------------------------------------------------> [VBUS of USB3 Ports]
>     |                       |
>     |                       |
>     |~~~~~~~~~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     |                       |
>     |  +-----------------+  |   (USB 2.0)
>     |  | USB2 Controller |--|---------------------------------->+--------------------------+
>     |  +-----------------+  |                                   |      FE1_1S Hub          |---> [USB2 Ports]
>     |                       |                                   +--------------------------+     ^
>     |   USB_HOST_PWREN_H    |                                                                    |
>     |       (GPIO)      ----|-----------------------------------------------------------> [VBUS of USB2 Ports]
>     |                       |
>     |                       |
>     +-----------------------+


I do not see here a "phy" regulator supply. Are you sure this is how
your pin or supply is called?

> 
> [1] https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/jupiter-sch-v1_0.pdf

This page shows the connector, so not the phy.

> 
>>
>>>
>>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>>> ---
>>>  Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>>> index 43eaca90d88c..74a1cd5bcdbe 100644
>>> --- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>>> @@ -19,6 +19,10 @@ properties:
>>>    clocks:
>>>      maxItems: 1
>>>  
>>> +  phy-supply:
>>> +    description:
>>> +      Phandle to a regulator that provides power to VBUS.
>>
> 
> "vbus-supply" should be more accurate.
> 
>> Drop redundant part. This cannot be anything else than phandle and
>> regulator.
>>
>> "VBUS power supply" for example.
>>
> 
>> But anyway, I don't have certainty that
>> this is correct hardware representation. It's your task to provide that.
>>
>> Best regards,
>> Krzysztof
> 
> I initially considered handling VBUS via the onboard_usb_dev driver, as
> we discussed previously for the BananaPi-F3 board (which uses a VL817
> Hub) [2]. I was waiting for Marco Felsch's patch series "onboard-dev USB
> hub host managed vbus" to land [3].
> 
> [2] https://lore.kernel.org/linux-riscv/aWJAT3n_KcND8bOz@monica.localdomain/
> [3] https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/
> 
> I am not certain if managing VBUS in the PHY driver (e.g.,
> phy-stm32-usbphyc.c and phy-rockchip-usb.c) is the standard method.
> I would not insist on the "onboard_usb_dev managed vbus" if this patch
> (PHY managed) is considered proper way.

I am not talking about driver here at all.

Please start describing in the bindings your complete hardware, not your
drivers.

That's a no for this patch, because phy does not have such supply.

Best regards,
Krzysztof
