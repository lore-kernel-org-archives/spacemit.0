Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099281;
	b=hkwsbBoP71hh/we3xMFhfjrb67ik8JjcFg4VGkB7reLLxKfy34KLL+wVcOBhsl0k7+EG
	 NPVXtvlbNV3az5j3xbb93s05CAqwFc1tpe3nbHW5sQvjJUvZQJL7kyMD97UaPMXQIWm2t
	 K+WZLabhnfv1rPZGP2bf9Ezu1/y4/Lx5CzvOTfZQwa7n59TWHijpv9seBwwi0HN/g04lf
	 c4Jga78017DduPwq6oP78MLdmGW/3LStRgS5jBcYZTgTHIvQEMKHuQVtHZHVE0SJ2sQ+C
	 rUU6omnkQ//tRPfT1UDPzxAp/zMA2JUjOGRfDLtllLZbbzPcJWEGRfqX4/gauBJyyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099281;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Fyeg7YgDyxCOYKOuvywES8/akQxJkCsv67OX1BIB/Yo=;
	b=eU0z+GoPbu3AAisBRU37rVNcRRLHioaqB09uyf/OJ32qZGH4tdVPaL4TrtBNylAiOw6n
	 PVwndiG+o/NJNFc+epm300BzCSyIcv3IFL0hYHCJPT83lvDIOL+rr4YdWTacDYO9t1P4m
	 HBRDa49kjSR4pQdRoDz2aGvqWvR7Pjtv1DwOK2VesACx9+BcjyXK9irTPe+VPugsuV/cA
	 0fKe66frGgbtAtxoMs1j4N044rXikhvQhT57kGA+suR24/DxAks5NuE+8uIHO1yLIyMfW
	 pJxXmplQhm+nTHonMRo0fc5cz70vgBPZbSg5LtgU4Lwrn23kXXDpkcoQohGaLyszkcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=U6u0UgQq;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744A606A326
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 14:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B744A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=U6u0UgQq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795099256;
	bh=Fyeg7YgDyxCOYKOuvywES8/akQxJkCsv67OX1BIB/Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=U6u0UgQqgaNL7QdxR3M4GHOdf8RvEZFPTlsEN4d0Tfk0QVsMZo/uw3rQnnx/rNa7w
	 O5f/Z/ZC3Yy3rtPuIzrQhWcl0dbyHWHsfL+jOp8dkSUPsTTppdc8laDborKx8o2ZKf
	 q7L4p05ooO3+mr06XoSoAzjpfynIr4/DGCIKsADk=
X-QQ-mid: zesmtpgz4t1795099249t82d724de
X-QQ-Originating-IP: AkaFsQhwFR9iPWv73Fx2ZrHRVujqZUtGELymO4dUxpA=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 22:40:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3019706064395514036
EX-QQ-RecipientCnt: 15
Message-ID: <858E773FB36F6B4C+00f181a8-3261-4bb4-be88-e48330500838@linux.spacemit.com>
Date: Thu, 19 Nov 2026 22:40:46 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
 <9db379cc-0b07-4efc-a3eb-ebc07e7952c7@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <9db379cc-0b07-4efc-a3eb-ebc07e7952c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MKzYG8XJzx27Dd1fGmeLwPrFywNDQOGmpUQ/wAP/G5Q1TlnDTrXpMf/0
	aFPjJh7hmK4olcEPWQg+umRQjdIYGHstYIyA023VjVtd7yNmQXekgRho+1gkAY02uZRPx4R
	qrStz1eRc4oQcbdoMVggOXfC0E6Dl54XIQJrarvVerKw3qTZWKq8f4HhpukuFk172ojFci4
	dhaengvIr6W5TletLdbnfQMemYKv0wcLGCw2eo7unJEXeVdJ+peU7AbyPij8NdLvtiAy9iC
	my7Rl7+5mOwR1NKXw8L2WNm1w6Pdx2vHYC9S8omNMt3QmthYG5oJPh/KDYXnzOuzcVhV2uT
	xg8+0N8BPGSWM8nfDBet5hLTSdBmLf3NYzieHHVbAM0xmp/f2+iLGfGovOlayD6dLbDzdWY
	6PBKsIimXUbYaHPoZ7u9RowQ7jRIAaPFqdb7bkUVRa9snFAfdYvE/BOYB36H2AgSjIuBPmP
	Tgx8lVwdNVbSPiePE2Y+dfVN8/mn7whNfQ18viAqafeYrgvAWSWbLeYhITe6Bv7H4axN3AP
	ubirnnYNO1j4oYr/PNKOPa5732Fp8CbCHjtUAhnW65yGwJa8pHkb7CUJpUBOgPciEXjM0XZ
	urrM6kphlzq8VLSi7x8Du4EgstozvmR7khKXEYBAn0GunYxWfjMNmIjDndYhZwM+2UyjAJV
	K/ochI8hni5LBOBWTrnroeNVy1eVO/SJPN2QWmghgPBhJpQG1llMmQGmXcfpqy9qTcMxc/c
	6rhbzTPzMgXfYeZhoswLgxs+VeggYlJ3sNK5ev3i0yd0L5RVROmSMb/e9ze50P5d/VO4+S1
	biY19XxRX7kzMemUoHeIV0SepVsRdBHpmrsJz8nx+tJ+wjhEVU+b4BuAfpasRG9gUJrhpbh
	ke/5QhzjwVsZJSdvgmZCVT9v7QKV+RGLdJhFMGY2mOPVEEcfrPgD3t6R6rn/YWaTTv8YQoW
	lNqIjqyvA5MLM1hBb862BpkE2GtDEZUNjSLh0SUs3TCexUKSWo4ssGXFFDp1ig3xX6fXs2E
	2N5xk+OXp6dlIKOisjoa2f4hyGyP8sGamrKjwXEw3IEliJzKTTNy3+kpq6QTXhSWYHNWcLs
	HKHkaxXcRdo1TULXQO520o=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Hi Krzysztof Kozlowski,

On 11/19/2026 10:08 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 14:41, Junzhong Pan wrote:
>> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
>> has no internal OTG registers, this requires flags which disable
>> related features set in platform data. Add a compatible string to match
>> the platform data.
>>
>> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
>> work, add constraints for it.
>>
>> Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> Hm, I could not locate this tag. Where did it happen?
> 

I think b4 collect it from here:

https://lore.kernel.org/all/20260928225821-GKA2079@kernel.org/#t
>> ---
>> Junzhong Pan (8):
>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>>       usb: chipidea: usb2: add optional reset support
>>       usb: chipidea: usb2: add SpacemiT K1 support
>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>>       riscv: defconfig: enable ChipIdea USB controller support
>> 
>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
>>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>>  arch/riscv/configs/defconfig                       |  4 +++
>>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
>>  6 files changed, 123 insertions(+), 15 deletions(-)
>> ---
> The series looks good, so 
>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
>
> -- 
> Yixun Lan (dlan)

It's a R-b to the whole series, so the tag is added to every patch,
please let me know if this collecting is wrong, thank you!

>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> index 620b564914d4..5c2b7eb1a6ff 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> @@ -25,6 +25,7 @@ properties:
>>            - nvidia,tegra124-udc
>>            - nxp,s32g2-usb
>>            - qcom,ci-hdrc
>> +          - spacemit,k1-usb2
>>        - items:
>>            - enum:
>>                - nvidia,tegra114-ehci
>> @@ -113,6 +114,20 @@ allOf:
>>            maxItems: 2
>>          clock-names:
>>            maxItems: 2
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: spacemit,k1-usb2
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
> 
> Were are the clock-names constraints?
> 
>> +        resets:
>> +          minItems: 1
> 
> This is odd. Why do you need minItems? What are the constraints?
> 
> This looks just wrong...
> 

Sorry for the mistakes and thanks for pointing out, my intent was
that spacemit,k1-usb2 always needs its reset line, but it's already
covered by `required` below. I will fix these In v7:

    then:
      properties:
        clocks:
          maxItems: 1
        clock-names:
          maxItems: 1
      required:
        - clocks
        - resets

Does this look right to you?

> 
>> +      required:
>> +        - clocks
>> +        - resets
>>  
>>  unevaluatedProperties: false
>>  
>>
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Junzhong Pan

