Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6132D780A
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107664; cv=none; b=faA3RcqPgGHg6o7P8lCjPvVUPhET1AdcqCCa0K1As8sliOLnuH3rGvTmMa+8gnaCHwE23CyBILlWo8S7CareLuV8v1AUflhZHrlnSxxe3YevqWQBJQTA0VQLAD5TdjZKkaAQZYQ8WprWj3sigtztmUoDwsXN7ywZIzcTF0ZVicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107664; c=relaxed/simple;
	bh=szq/rOHUN+3GufB7hVfQTfjTIKoq4aYdgJfWA0SfWRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAbtKCBZS5diAvPMI3YzQPxBJFjF7qlRSxaX9b6pR1OSp/OnFOLkuCNOZUdrRFAEMMwJ5x3TAJFNywmOyTEq6GzzANsTyzNaigqU9OWCxNAM6ntDZN5hohgGf2bs2QWxhRV6jaX/5QhOKe3BCQMC0T38cZVqUfrEJVMFom6ebXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EwZv1Fps; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EwZv1Fps"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b67684e2904so4556329a12.2
        for <spacemit@lists.linux.dev>; Tue, 21 Oct 2025 21:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107662; x=1761712462; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=EwZv1FpsJTTl2m1QWwLOIrSERmnejkJNz3DSGsE8BhljFhPnGTUwdkwrxg7HnCfcXx
         FtcNq67dnyInvD681Y27EklRbDbq8IYk1bmb3hDogybqf9M4VwQvxOYZRF5y5Airis6H
         LZ4KkLb7ZrTm0vvySDxzuJ43R6ImvbdniG6OhzhbD0E4fTAgdrKF7XIjIWdrzsdRWohK
         Wb6Y7Sqi8ClGqKYMLa/DjX7JOtEWeetKIY8YigOaFK7vSMt8JaFg+hDFbShA2wOSGIQj
         GcVCtlMTMxJK0qzdUQEd/gR+Lu5lr02kZcPA/Q/FoMIDsM4MVmsk/v9kGhWyj28DtY6+
         pxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107662; x=1761712462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXV9nPTtzRS7GB0GpGCBfWyozkzIjx5wpujc/niwppI=;
        b=se/rtGU+3y9rZzVH3paD0MwsKgf+fASaNqxD4sScv7gOj8XE7WUb/1+doQN8wxh0KB
         PHHxG7+bzYzdqImYU0VtWo91QtuZUrhJaA2iBQZ9ayeNKSA4gNnokfa8XGAg/Yzl8/EG
         Ir/trzfSeaOmOqO0dPA8aX5HnMRq7lYGqr3OMB+9mDyU1s1pEXsm9AAhtUOeiyDXso8o
         CznJzy2XKzEB+S/ltAJslnm4VSSbPlwa62J2JMavliGGEZuu1ZmhJslO0pUFLxSZn0kM
         Ijh2H6TojVmZrVJwv0ktbtsuEkH2lIhhgYmHrP6l3lTaudBv7B2FAzccNtYotZpfz/Fa
         yxkg==
X-Forwarded-Encrypted: i=1; AJvYcCUhTaEK8M3FTkLT931SkiGEsppDWQ+rl2UVMLNjxdRHQKp2ZJhEraMD91e+VTv/ZPpnWPoZn4Jc+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/w4MzdtgSbOrvg69+XUV/CAvBXau+ogouqD/d3sPz7hVDrYNv
	CTdbR2N1+aw+VLHukSNpOXU0/CegIHjhGAMKSQ+Al14MoeV3pav+5EyiT/sQD/e7l7A=
X-Gm-Gg: ASbGnctLJgnLYXDoBeMT8IHh1JTuraLbMZO3oT7x1Uuuic+pZ5RULdNY5OMFZOrQ8JK
	WBkFCdmPjFdqwBYRk0eneXdW1+WEKo4LMB/xr7Z7gmOMmRYclv/F/44dnZfipjrNf8hobTrCB01
	2VYXvCCDRbrfYOZVVrIyOQQyhUus3JQoLmtie+PYeiRlCDW8eALMy5R8vDTx061LeG73GS4Kddh
	gL/0U9eJt/HRkqobDjpqTDe5/jLcd3T0DXBnayu+/dzYCFh19YqQehZAcmsxVL7r1muj/uL/k94
	5HQ1zOQEpFoxZvYwZCA0el0FdSS7C3rv5kYsZZHSMDB5ECr7olOgvZcQAZggtZ4j24IOxHVQv16
	TO9Q9h6IMijRswWuwsYcBIMbqg3Am4ClsSHwVDYb6Ho4R91MUqvbW4sju5TQpqtZHYlH1YBNqlh
	EYhsvHx4QH9cQ6
X-Google-Smtp-Source: AGHT+IGMxMq8ODA384WIjA22NE56jXOrifm3A5Z150bOKY/fGOgxvMMpMNK8BhQcEf3SEUsHJhYpWg==
X-Received: by 2002:a17:903:298d:b0:267:87be:505e with SMTP id d9443c01a7336-290c9cbc185mr219746635ad.23.1761107661774;
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:21 -0700 (PDT)
Message-ID: <c93c1319-2f1f-4303-bb4b-751979f58149@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:20 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] spi: fsl-qspi: add optional reset support
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, p.zabel@pengutronix.de,
 dlan@gentoo.org, guodong@riscstar.com, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-4-elder@riscstar.com>
 <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaIezCu/gXxJC01@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 2:07 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:46AM -0500, Alex Elder wrote:
>> Add support for one or more optional exclusive resets.  These
>> simply need to be deasserted at probe time, and can remain that
>> way for the life of the device.
> 
> Nit: please wrap at 75 chars

You're saying wrap at *longer* lengths, right?  If not, please
clarify.  I'll update in v2.

Thanks for the  review.

					-Alex

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index c887abb028d77..1e27647dd2a09 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_qos.h>
>> +#include <linux/reset.h>
>>   #include <linux/sizes.h>
>>
>>   #include <linux/spi/spi.h>
>> @@ -267,6 +268,7 @@ struct fsl_qspi {
>>   	const struct fsl_qspi_devtype_data *devtype_data;
>>   	struct mutex lock;
>>   	struct completion c;
>> +	struct reset_control *resets;
>>   	struct clk *clk, *clk_en;
>>   	struct pm_qos_request pm_qos_req;
>>   	struct device *dev;
>> @@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
>>   {
>>   	struct fsl_qspi *q = data;
>>
>> +	reset_control_assert(q->resets);
>> +
>>   	fsl_qspi_clk_disable_unprep(q);
>>
>>   	mutex_destroy(&q->lock);
>> @@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (!q->ahb_addr)
>>   		return -ENOMEM;
>>
>> +	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
>> +	if (IS_ERR(q->resets))
>> +		return PTR_ERR(q->resets);
>> +
>>   	/* find the clocks */
>>   	q->clk_en = devm_clk_get(dev, "qspi_en");
>>   	if (IS_ERR(q->clk_en))
>> @@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = reset_control_deassert(q->resets);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* find the irq */
>>   	ret = platform_get_irq(pdev, 0);
>>   	if (ret < 0)
>> --
>> 2.48.1
>>

