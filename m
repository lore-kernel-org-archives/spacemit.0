Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2D28B3FF
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735482; cv=none; b=Kcn9NKvvG3izhrA7Hei4B7tKQAusupEjOE7mfS4uZzaLQiiBINB8Le/CvXeEMqkJVcPA8uLZqfcaGarAyWPkr7eRyvkeVIpXffiEOsJA+Va0BsOAU052ByYIAxRFOsdTC7BSQIVGSBrhAsZnfUEbQDwyrzeJ/M/vyCqAZZ2IzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735482; c=relaxed/simple;
	bh=kuj3J89E1w9k3j1xG7Kt4AOv+U92lZcafSs9ELxQOa4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+S/fY/vBXAcQe6rkT8egIWs2Gc/djqQm5xMVLbt17e2fFpgEtP/YhI5sz0XcdzgdKggW7GiGLEfTL5wTaEigAURM2U+03OKXPhQL9WWpjv5i+WGZ0wQC7oftyIHUbYcbGs8SMwjOknyeXS41GLp/dC5JoMrdO8bTNESVjbQhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FxTpIYM3; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FxTpIYM3"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d81ca1d436so10738655ab.2
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746735479; x=1747340279; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETi+juIkyQnejMlNPha6WwCCX1oR6QtFi1j8HpYbzjk=;
        b=FxTpIYM3MHRSkRivllbaoE2S/zZzGBsxW5HNMysfYZ8Ls1sA0R9muA3iCSYrZLa8D7
         qRzkP9hp67bAZCcMxGrvQXyOS5/eVQitjO0yYwWSs59CkntEDbtFjh20OQ/XWuo7r8Z/
         eb8ZWVrmNcjhjWRZM/v69hjBqTBKb4Q7HRrT7zx9k/cU7LY3cQ+KaHzjnRZQ0UMR0yj2
         Il9DE/SXlV94FOr8stp67clck5n8JLvTkRusl5guxB7ym5jQ11cWgSHz2/MraSFeHkvZ
         MravI+zGuz5ZamIpWVIw5vo3g/trUf0aTMBLxI1ocVeTe/0fJ0z8mLje8/4WYDbNBWiV
         u1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746735479; x=1747340279;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETi+juIkyQnejMlNPha6WwCCX1oR6QtFi1j8HpYbzjk=;
        b=cJJgOZEjSv/hw4zw4Is/tWjjAdVee3Yx2VQ5YlqrLlnkmzpVNYpikddgggW0UyxGjb
         B7tZIde0AmMkpXgpLdMp9lNeNB+wVYaQllKyZmC5zYx7aFLj5AIs560rHSZarRFY+Rg/
         5MX9lEnR5JrXZcI1MY/j1bw4gwBwLg910uP6+ZtHf/ZZlrtZCWPKSI7nkax1VYLz2+Vo
         DbrFai053mveFq5WLYa2gkcVtW8nLcApj/4lyNuTYVVskJe/JFryV72l47R6UrIWpvei
         dU8+eAXbQ/4tuYEYNVBEzdJLKDfRrv5OCFaayQVTfiquB9lPaWtCMxOCLIsTufV/gYeN
         efUA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFxP+7BBuXnvCrEPkTvklZcvUxjrgKqurCW9vzIa1axy6E5qDL0GsVCMPon22tSIGaR9QWECIQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuOhrhLeo9LOhygMoqxUgAB41ZZp5S1lO/cl/ljgbp4uQlW+xd
	xSbGbxdDsK+c7Z/+Pl6Y8whbq+021pnTOZ12SDPs2R+hyuEmj5pRUQp19yASBcQ=
X-Gm-Gg: ASbGncttctF7PEV4n/ypJQPhbMwoCcD9nS3YFo3lX4gsnHLtIn7coko4srZZDN28X33
	O/Bn21/u/jsIggJ4VQVQEyVfiXK0bVy89817M+8y8bTOolOdE7g1QnxY3LKB4QsGlrPQpuG6vdh
	bVGv2BqEcNe+gnNURh2hm+J7ew6HHefYMxQgjsUTBe4ErMpFatl7lWXDb4GyguPSALdzvx77HVf
	XEJjurSTyBWN2BT3f9v0lbCyvI/82tKShRpiyOGI95pZsGW49zaLZEfBgIyi/YMWnnJROhLlwvb
	dIbO6KXyXmgaxYApcImziV5R1AD7BZEyFOxgdYXHdqlsYGzR5DslWwYvcJn9TAKYgtOdAn2giJY
	6Hqtk
X-Google-Smtp-Source: AGHT+IGJAd0oucTC9Dfp7hY2K4c9PGXfx+VquDL7ztVyi8dVyRm1MKOCjz+TCJ63cr0iCG2Azpd+Lg==
X-Received: by 2002:a05:6e02:1605:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3da7e1e6ff5mr13544025ab.9.1746735478876;
        Thu, 08 May 2025 13:17:58 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e0f9a5dsm1342015ab.15.2025.05.08.13.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:17:58 -0700 (PDT)
Message-ID: <ec118fe2-00c3-47d0-957d-cbd7a8ecfbb1@riscstar.com>
Date: Thu, 8 May 2025 15:17:56 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
From: Alex Elder <elder@riscstar.com>
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com> <aBw3KNwjMeCIfnNR@ketchup>
 <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Content-Language: en-US
In-Reply-To: <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/25 3:04 PM, Alex Elder wrote:
> On 5/7/25 11:46 PM, Haylen Chu wrote:
>> On Tue, May 06, 2025 at 04:06:34PM -0500, Alex Elder wrote:
>>> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
>>> non-null, the CCU implements a reset controller, and the name will be
>>> used as the name for the auxiliary device that implements it.
>>>
>>> Define a new type to hold an auxiliary device as well as the regmap
>>> pointer that will be needed by CCU reset controllers.  Set up code to
>>> initialize and add an auxiliary device for any CCU that implements reset
>>> functionality.
>>>
>>> Make it optional for a CCU to implement a clock controller.  This
>>> doesn't apply to any of the existing CCUs but will for some new ones
>>> that will be added soon.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
>>>   include/soc/spacemit/ccu_k1.h | 12 +++++
>>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ 
>>> ccu-k1.c
>>> index 9545cfe60b92b..6b1845e899e5f 100644
>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>
>> ...
>>
>>> +static void spacemit_cadev_release(struct device *dev)
>>> +{
>>> +    struct auxiliary_device *adev = to_auxiliary_dev(dev);
>>> +
>>> +    kfree(to_spacemit_ccu_adev(adev));
>>> +}
>>
>> spacemit_ccu_adev structures are allocated with devm_kzalloc() in
>> spacemit_ccu_reset_register(), which means its lifetime is bound to the
>> driver and it'll be automatically released after driver removal; won't
>> there be a possibility of double-free? I think the release callback
>> could be simply dropped.
> 
> You are correct.  And unfortunately I didn't include the fix
> for this in the patches I just posted, because somehow this
> message was not included with the group in my mail program.
> 
> I'm going to send v8 after I fix this and verify it again.

To be clear, the fix is to use kzalloc(), rather than calling
devm_kzalloc() with the parent device as first argument.

I'll also include <linux/slab.h> to avoid the warning
reported by the kernel test robot.

					-Alex

> 
>                      -Alex
> 
> 
>> ...
>>
>>> +static int spacemit_ccu_reset_register(struct device *dev,
>>> +                       struct regmap *regmap,
>>> +                       const char *reset_name)
>>> +{
>>> +    struct spacemit_ccu_adev *cadev;
>>> +    struct auxiliary_device *adev;
>>> +    static u32 next_id;
>>> +    int ret;
>>> +
>>> +    /* Nothing to do if the CCU does not implement a reset 
>>> controller */
>>> +    if (!reset_name)
>>> +        return 0;
>>> +
>>> +    cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
>>
>> Here spacemit_ccu_adev is allocated.
>>
>>> +    if (!cadev)
>>> +        return -ENOMEM;
>>> +    cadev->regmap = regmap;
>>> +
>>> +    adev = &cadev->adev;
>>> +    adev->name = reset_name;
>>> +    adev->dev.parent = dev;
>>> +    adev->dev.release = spacemit_cadev_release;
>>> +    adev->dev.of_node = dev->of_node;
>>> +    adev->id = next_id++;
>>> +
>>> +    ret = auxiliary_device_init(adev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = auxiliary_device_add(adev);
>>> +    if (ret) {
>>> +        auxiliary_device_uninit(adev);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return devm_add_action_or_reset(dev, spacemit_adev_unregister, 
>>> adev);
>>> +}
>>> +
>>
>> Best regards,
>> Haylen Chu
> 

