Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD61FB1
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264247; cv=none; b=VY9bL5ttRfpIu3EJnwS8SDbLKfgX2XrM0bn9t2YOhHF7ZYNRzJJT5J9DUHvVg5NzkBAnK33BooDXs+0KPp5P8qKzzD8hiVlDCPtsVOadEhwlKNenk6ts7I0uF3IHeoFd+XzNc1Zgjb9bcwztluZfiXCfemGGVAyKnG4qyLKlEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264247; c=relaxed/simple;
	bh=C1jkv51ztRxfrNfz0d7YqP/iXJQqsBRzL9QozwFBY9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCfjCdCZWM1npVHAAmyq9h+ysee2+9nA151gD20RRGM3K++HCw7OA+6QEoMsFS1DZ/96RU+9Ffr9megEasgYzq4ak/DtL5kxlfwyTg5o6Pn55oq7NQbl/vZGAiD4jmgIYyzhugWyhw5xV9kId0AzRGWKKjyFBR5pwInzS78MPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wqgnjsnb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wqgnjsnb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2897522a1dfso14291595ad.1
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264245; x=1761869045; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=wqgnjsnblfjTMkEiWjlQk3tOLpUvU5uV8fmB+1893pLgzofE6Rm3uaa4frJ1TRFHQj
         Q/Ryo9P7XmCapbx1BQkNr0NQSqIKBXlTP/eEts8W+vilMHBajxgSBq9q6IpZcQ9Jxzbe
         3D9NrJ27t6m0gK3qgS15FIlDhIHRVJt0YVP/rGjzUCgJyR60ETr1uxZOkHbodGpyMIuN
         g9ZlHGzTQXpTsLwLYSCTopEYtexODcTihn8jPkd9VYh5zVe/PlrKJzx0BdebOt912akC
         CY4knfQVLotIx6o1pLZxGSyVzxMaGgolQ8DEWId99B6WU+RxLaDDuZxAqBuMHOvT/eXo
         4wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264245; x=1761869045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=M0v17rCzINkcOjnwmBngAAdodfxzwvipFLAOEF0OpR7naJTwqvyYzf6UlNEsqY9GE4
         HWQnTCsAIIsIaXMAh5OACUcwO/mkHTOYL8QroYKtG5HRIEbMINRI09qAQlUX52X9TdoU
         G1Y8zBNsKulrApYj4I2ErwcF9l3GnmVaoWVTfUs6cbDc7B9UGU5R5sekONRDgVMmNl0f
         iqoaWkWDlcVmCWtiVfkut/cYcBEF8VGf09X1D3sWzTlus0rRonGlC5kDcuIRD6gn73Dc
         3Q5r7YI1aBPk/oMl8Cz0Qttq06yPXhq1YlmnXDQz2iKhC3yHSkM/XWkPdiFxncIgOsKu
         SAzA==
X-Forwarded-Encrypted: i=1; AJvYcCXhKYO0WcIgc0FaubpKDRGZh4MZH9r0WSV0MJkyjA82rOnjPcrNWo9vUvlYkZlNtj0UJw9B9ybVsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO2i+fpEA4+0ZUR4US+LbzcQ8Ab/+D/kYypZaVTdqTRk2PeHgk
	Z5OpQEtoINySF/RW1ZKU9+9QfZzcEIBnmANMvaCnLLxGn21/qq6AOjKgb+SoNxtZTs4=
X-Gm-Gg: ASbGncufKCWoNOyV0HZzVhig2KVSHNi1586OUSYFx3j6t9KWDDLjFPUnNBjYdf5RwK6
	babGZBcSPzwzSlh9UUbVuFf0IDEWjXa2yPv+sbfJNGf0Gky29mQgzbDGQ6RRvq16QC1yEDlbB43
	8OtRm9I4ZrtR6R2zZZQLW+1V1HqXu0D1L671yGp7slNm5nMA5QsxWClALcZ0FnXAzNjy/Adt5eW
	eAUU/xk71s8EyMtHO7QqXHKmqM++sjIzt5xnN6LdWXOsNVuQPSGNTa3+rfNck2AV1Z2DvlCwz7v
	+S6g0bFytjvhItHblTWbtCg5EQwBc3xSNBFDqcvGeRyoBoMehhwtOyVeaMpX4hB+Ap6L36mSYS0
	b0ROx4RSZCLW8UPbeRH7UmjEsPIhwrLjswCThwvydbbPWUbVCpTXrgJhzRBfvi0DOabuRnjxeVc
	sYal/ErNJzErvmhzIC
X-Google-Smtp-Source: AGHT+IH/sqOkgJHPoJp0C3PRAnpePjJuvBDUdrVuB7xX2bh8XQc9etMQIVsugloCyKqrfw/GQPbVxw==
X-Received: by 2002:a17:903:38c8:b0:276:76e1:2e87 with SMTP id d9443c01a7336-2946e22bbcfmr48197185ad.44.1761264244857;
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Message-ID: <c4da7114-09c2-4c66-bdec-ee80cd7c5f5d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:02 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-3-elder@riscstar.com>
 <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:32 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:14PM -0500, Alex Elder wrote:
>> Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The "reset" property now only applies to spacemit,k1-qspi compatible
>>
>>   .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 5e6aff1bc2ed3..edd3158a6f2e8 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -55,6 +55,21 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      not:
>> +        contains:
>> +          const: spacemit,k1-qspi
>> +then:
>> +  properties:
>> +    resets: false
>> +
> 
> strange, if-then should be under allOf, I have not seen you add allOf. And
> original file have not allOf.

The file currently has allOf at the top, to reference
spi-controller.yaml.  I'll include this next time within
that allOf.

					-Alex

> 
> Frank
> 
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.43.0
>>

