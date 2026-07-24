Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B84334A6
	for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784899939; cv=none; b=NEH332wiw/Ob00fCc3r55hISYDEbpzLCcmS+MPHCxOEyEd+48cSJIuK7Aahb2e741ZdWuGrKeQO7Dm7D+wFyda0rJ2Id9a2D2PpzOt97o3jBZyBfxhxBCn3dAcT7vhO0yTNiOlaGhaUDfUhm7AnQnOEYuZgn4BQEW2rjFqAXHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784899939; c=relaxed/simple;
	bh=4Vz7bLvr5WHA0dMOR9VX2kvuY4SKO3y6uJgdiq2R870=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpbJL2WrJjXiGNXwwuTbPo+M0bXl5QIC21k2dOusWH41tzL7o4wxK3pTUyUcgqSjfpceLH1MsRrd8yZRkc82b2QkNhMJXdCZwQPnjJyQb/RrqQrtXfQgX2MvxPD4qSXfV1Ck4trZkS+6B0kOPpc2KUZy2CtAowtL8pJbod4EL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=oUEc2Y4Q; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="oUEc2Y4Q"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c0ecfaee7so3175491cf.0
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784899936; x=1785504736; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkOeO7FvZNYqVYKq41a3VAqmcoUNFjFQHw8ZY64/eu8=;
        b=oUEc2Y4QatBPgUvJ7T8hlOsLqGenKB598Pce1Man2A1bPzZ3zqCYxHfH0Uv79zMD+z
         W8P7C9lGLj9PJVZc3MBBe2Pdk/P9UnFKkVC2EWLsFnN5Qcfy9iO7mNR2qLfTccqiKfkN
         ZMVvA//36hc/oKrXOj5PSXginZr3QTDcONI4lJlg0pE0xbnyDBB2BQF90TXI2JMZ6AOk
         nOgzW5OgykV/eiReHOHZrz4sXgPf1nBiiRTmalDF1T+hT63b68W2BIHErwvMYZ8APrYz
         OER/oM4l4aZNmhYKGnCpxNwEHoYM8H0Zi6PK/suY/G9hT6EyjZxzR7JCypkz6hbGPfAC
         pR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899936; x=1785504736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkOeO7FvZNYqVYKq41a3VAqmcoUNFjFQHw8ZY64/eu8=;
        b=TS0bUGheGdlZT6EGWOYaKr/bBEQUdofD7oHjFPhb6R6iPM5wd3mgh7HYzZHo5BOlrb
         OZ6q73oAbaKgJVfoJHEn4fUw6SRD5HQuFc1UWqvmsmnRisMyYhHVSGF8+B/5E3EiAssg
         dgJXyMoFXqzyBEqbauEEYt4mSiSFAh+JWoJGSq9XZ3gpcDoYvPyDAq5An3FSqjRPQw/l
         Bejf4IJCuazusOyquzco5JFNuJOOSaKEN7ADJsHcAmMYVZPBELQlGy5VqqJahIyzjywp
         sF1PZ1dC46AiijumSU6vUyZz/mll3xALBbBRbVGI6HYXPis9xU8HiEbk4N+XE90liO2G
         DKaw==
X-Forwarded-Encrypted: i=1; AHgh+RoYZNmzlR+1kCUAy4+Ic5x9dhMmFOIkIAFT2apLWMd/1f06FKVYue9GCoIAZbi41j+M3+VYOlegfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDLKYfMEUpoXsEetX+w1Fo9SymdmOZeFtOACyCGD7IGicepD0w
	WAaIzuGVbInjp1k2r8dJxAzwOIlOgCP1hxt6FToDgu780gqb784CnU/D2n1OMGU+h/o=
X-Gm-Gg: AR+sD10gvEDb2aMYQLh9nVErAORfO+5tedDmbdMUTH18waT0BtgrrNPm8hU8JMuQlga
	i4JBl9xCrHI9X1JPxWMrxN9JBlyq1oXj13++C6tfS7ULEWeyVyqRrvd7Tr+0H4iWEfeBbGhaBC8
	LPjwqPYu1phcLnrSYk+D6BewfajaZtsdgRbuwFgr6LjwDPr2OmPMwak/USW//EFUYIW5+koLngX
	7tQI8pSJcMjAWbU6wUmsMLFARnABrg3RXX7fZ0w3ZNyl9s32q76rFgIEHyK64DqM1gsM2mvGPMr
	owQ0qH7fgVEg3rdiYieN/WNC5QQP2VifzynxBNY6o054NHvsKfhysdMvVi1RGsqMXLaM+xHq8lT
	xs/Zp8uahyisWTuH+LBlcNEzZmmuTguL26GvwWp2oIOAUzpd+ZLtKBAl1Oy/VR7TJWZHJDMiME5
	xdDg==
X-Received: by 2002:a05:622a:8c:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-5283df63187mr68450411cf.63.1784899936358;
        Fri, 24 Jul 2026 06:32:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d0c4fe92sm53114091cf.11.2026.07.24.06.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:32:15 -0700 (PDT)
Message-ID: <39995013-3520-4290-a791-1f5d6a25388c@riscstar.com>
Date: Fri, 24 Jul 2026 08:32:13 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: spacemit: handle regmap_test_bits() error return
To: kr494167@gmail.com, alexandre.belloni@bootlin.com, dlan@kernel.org
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260724024220.10113-1-kr494167@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260724024220.10113-1-kr494167@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 9:42 PM, kr494167@gmail.com wrote:
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> to check if the RTC was enabled.
> 
> regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
> negative error code (e.g. -EIO) if reading the control register fails.
> Using !regmap_test_bits(...) evaluates a negative error code as boolean
> false, causing I2C/regmap read failures to be ignored and incorrectly
> proceeding to read time registers from a failing device.
> 
> Fix this by capturing the return value of regmap_test_bits() and returning
> the error code if negative, or -EINVAL if the RTC is disabled.
> 
> Fixes: a6de182daa2b ("rtc: spacemit: support the SpacemiT P1 RTC")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>

This is an I2C-based regmap, so yes, we do need to test
for errors when reading or writing registers.

I think this is a good fix.  I have a minor suggestion or
two below but either way:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/rtc/rtc-spacemit-p1.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
> index 43ab62494bb4..c1820c920ba3 100644
> --- a/drivers/rtc/rtc-spacemit-p1.c
> +++ b/drivers/rtc/rtc-spacemit-p1.c
> @@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>   	u8 time[6];
>   	int ret;
>   
> -	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> -		return -EINVAL;		/* RTC is disabled */
> +	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
> +	if (ret <= 0)
> +		return ret ? ret : -EINVAL;	/* RTC is disabled or error */

Since regmap_test_bits() can return -EINVAL, I wonder if a
different error code would be better to indicate "disabled".
It can return -EBUSY and -EIO too, as well as anything any
regmap->reg_read() can return.  Scanning through the list of
basic error codes I don't have a good suggestion, unfortunately.

Otherwise, perhaps just:

		return ret ? : -EINVAL;  /* comment if you like */

>   
>   	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>   	if (ret)

