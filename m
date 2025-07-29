Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBA2139C9
	for <spacemit@lists.linux.dev>; Tue, 29 Jul 2025 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753769901; cv=none; b=cGW4WIytKyne9GCGXQdVrNm2e6oa/+SjdCm+OLltCgdVIXeG3HEBxpcTePptj09hZeGpkLgh86RuuAWjpUuSBf84iqaNU7Pq9RX7F+wHpwJihKK3BeuJPsG5QWfNAn8WuFSMyxtNszILXHahKVsxsjr9k6UlwQLmAZ+T/mXNdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753769901; c=relaxed/simple;
	bh=LOcm7KXGaTSxaImwNEBErillVBK69tcwozRmCBFN7M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLhRUJBx9Mojntrq4mY2LJT+boAEI/zor+EIQcfQtXA3e7Rmk9vkhxzyV1YMTmm+9gVDcRg9MJPF9I5F+Tf4bw9ebKY3n6qu8gKN9ngSKFmOio2F8Tt0a0h0mboGM4En6b1moX6kXUIysQnMbaW2uqA/SR0incUU1MozBiyJsvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1NGcSfe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1NGcSfe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b78ae64756so84170f8f.2
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753769898; x=1754374698; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iojwzruvvVhAQ7wvF6ZE60oEZ08ONaB5lYxNaGGz2NQ=;
        b=N1NGcSfeyuTqXc1qKrw3fsXzvWwLTjB4/9Ezb5gxsKgnqodbu2QZsNTau8wF9dbMs2
         957pF+pHhbDR25AACgWjor9e5wW6yKjtPob9NMDTwKoW5O6G7PfoQM8KpxrlCKICL0g9
         TKBwY6K9a3LNBbfMa9aZNypbaSwx1Wx0UUq5h95qsgE8gSA0UM6vVIyHd0n+Hk3bVdEA
         Cr5P0vjrHmjUAxJxMogESslxmoTs9vRRSNqe6dIOuPhBjblQ4Z9IASaJaSidFPvvkiyC
         g3CJm0Uq6iVGQyBryjtNhalI90q9pckKMIajwxokgurWzLAdFhu3sl2ruPQywfDPbBqM
         ZzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753769898; x=1754374698;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iojwzruvvVhAQ7wvF6ZE60oEZ08ONaB5lYxNaGGz2NQ=;
        b=jzIIZGkqeLuXsHa8S7FQ5JjtV1vsYkZBE1Ext7TrELi+1TuuV0r9WUbegdtcNWpAGi
         r3n880+L4+Go+7cA1TLSg9k7ttNuz+CUmIg0/qX7FZ7AJUJrHAmgiYszxmmV/m74rGsy
         9qc25+tVBZbK0vjNytLHNWcSJdE+jWhjSe0d83h4afxL1NMit+NM9NW6tqDJZiLtKMek
         6DyhF+Vw24PjsSwO32EZERXS5Au4n0/hQZoRXeYOuICwvhA6sICY47NYwO7FVNlNSVpO
         ZBsMvfMJrW3dsQRGB/8TE8rxbvVPQkNHTjVgJKnicDs6XjjGQMfdfc2g3JVgsJ5ZKCpC
         hKeg==
X-Forwarded-Encrypted: i=1; AJvYcCXk9Mew8tISzJNu39e2ebnNcR2dnWRVxxihLo79KhhS4xGtY2SI0GsZsOyhYUmBXtNevLXp5IJqbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN7x5I9e+jk/3go7fr8biRtBJmRMfMFihiPV8kOtYM3cx25kpP
	s+E5tmDfNEwxN6xRn6JCAIFCLL+TrgIPsEYnUFRI6yTt4FdprDz3pBR+H/Zam0sABLs=
X-Gm-Gg: ASbGncurDoTEKtyCaaHljXcIcJls1l3hDgwaUFHe/toaKU1+tDvh30sWqSZ0JyAFzn1
	aoELnMDUBovHzk4Es+yfKdzfOyqcgDdmyehh7XcU08DS9Vh7Cau0KX5hAOhERoeIdwQX3zSjScF
	8M3U3ISl5wy030Qs5IRSkXuh5WWlEmxMbuCXzv9sTRqoV3Yty4j+iEm1bZvqjS6YUjp0rE9YizB
	z41XQ1Fd+JXfzN3IuXBMYnK+kVUCyvNy2ux72kVhASW0y3ETnnVVJCiKp/wRzRoK9msaCH8I9qO
	QU66NAxsntnnCh6rgl4eTkOaMKQjeompjCnos2+sOmaXj3EHBGpVtLEcRfktai2tcAIBHZSIvSy
	PX6RK0elhd8jUMh2mAuqIKgsue+bqYgxly+CwGIDLIJ8=
X-Google-Smtp-Source: AGHT+IFKMbXWi0CwmnHyn3tgyLCZQgSOUQBMZIij8kI76/pdZpcK3Rh2CaXNNCukSuKoaxDWztBswQ==
X-Received: by 2002:a05:6000:40cc:b0:3b7:8b43:ac7d with SMTP id ffacd0b85a97d-3b78b43add2mr1376216f8f.3.1753769897578;
        Mon, 28 Jul 2025 23:18:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eba0e6sm11065009f8f.25.2025.07.28.23.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:18:16 -0700 (PDT)
Message-ID: <6479ef96-b7d3-40f6-aafc-a7a8a4177c41@linaro.org>
Date: Tue, 29 Jul 2025 08:18:15 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
To: Ze Huang <huangze@whut.edu.cn>, Yao Zi <ziyao@disroot.org>,
 Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250729-dwc3_generic-v7-0-5c791bba826f@linux.dev>
 <20250729-dwc3_generic-v7-1-5c791bba826f@linux.dev> <aIgmrQ7afSO5sjB_@pie>
 <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aIhi9JKZvuYh2Rz_@cse-cd03-lnx.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 07:58, Ze Huang wrote:
> On Tue, Jul 29, 2025 at 01:41:01AM +0000, Yao Zi wrote:
>> On Tue, Jul 29, 2025 at 12:33:55AM +0800, Ze Huang wrote:
>>> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
>>> in the SpacemiT K1 SoC. The controller is based on the Synopsys
>>> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
>>> DRD mode.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>>> ---
>>>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 124 +++++++++++++++++++++
>>>  1 file changed, 124 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..7007e2bd42016ae0e50c4007e75d26bada34d983
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
>>> @@ -0,0 +1,124 @@
>>
>> ...
>>
>>> +  resets:
>>> +    items:
>>> +      - description: USB3.0 AHB reset
>>> +      - description: USB3.0 VCC reset
>>> +      - description: USB3.0 PHY reset
>>> +      - description: PCIE0 global reset (for combo phy)
>>
>> Why should the USB driver takes care of the PCIe stuff? This sounds
>> strange to me.
>>
> 
> On K1, PHY depends on the clocks and resets it shares with the controller,
> and the controller driver is guarantees that any needed clocks are enabled,
> and any resets that affect the PHY are de-asserted before using the PHY.
> 
> RESET_PCIE0_GLOBAL reset is necessary during, and only, the calibration stage
> of combo phy.


But this is not PCI! Why would you call it "I need to reset PCI" while
you describe the USB device?


Best regards,
Krzysztof
