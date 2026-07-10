Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27142A160
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687871; cv=none; b=lNKjrxaK+is7fr8CropGbfD5YrGjqa+hASpMsq1RAJajWDo6Uec7INmLLCkfcNiJqdAaGia8KBLH68mvYUMIKf28S+E4MsvtZQa//MCNQOW1bvZOs1NYzXzk3NF0I0bHaasah2E6Qk2yJL/gPz8NH5iveh5vAlXN0+QMs0tD8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687871; c=relaxed/simple;
	bh=6ikcLdHgMP7Ta1QNKMU8D2+OrlHjityLyO+ugcqC5/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htr79bf7OcxznO3snlIEcJulV6N3hdJ9j6Z8ZBk7ESt2DBo0WKNOD8F62MsYg89aNZbo+jzNvC5NPit1x7cD2UYITzP5kyVqc/f5oqnwvicgkvNcvcCeyzBoGHRfg5MmF5c8Y/AFXWwTElIirRD4jWE4htMnAHDrlTsWU0jm0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=om9k98lp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="om9k98lp"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ff88549786so8521216d6.3
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783687868; x=1784292668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RI31gw/Ag7VVxVHoPD2L4lb5ga+FSsjQx8Z6xYz3UlU=;
        b=om9k98lp+W3kjfN6ftktC6Xw/eoXIOxq+CFOy0dPmLty5k86IoYWLg426UChJx82Pw
         crJfb6xfZP9CoxX+CG3bR6W+SJkBM9bQ/3IHJ6ZxG9VwSXwkqidX3t1r3t9LkPDbtMqO
         hziCgNp7aDnQ9LpjxUX3KLGywGbyeQI++r6nhVCbVZWptJ3m0I97g2t/56hPtFEl9XAF
         h+1Q4J0OeVaZjG8NX8fNlsz7uDAdCS2J7XUplVkZCMV4uRWWkDOYmZKozbDCkensebDf
         PUD4Xsgw3VzD3rzjzD/BACUb9xc2IC6bxCnBMwpWPWCkkytCBJOUvVoF0vGDxnA7aG+n
         R6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687868; x=1784292668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RI31gw/Ag7VVxVHoPD2L4lb5ga+FSsjQx8Z6xYz3UlU=;
        b=R/Sx7+257yCbOq40i9ilqEVux2XK6KVcEQoLu13SYLf3hoLB59cCj2P7oPdxcW1SqH
         PyUyj31WpRDa7mO77egDJtwqXWJyNL7t1szHPRWzLQnMAZMyu0SFhSUc2YtXUpJiDEJY
         Y+gVfNsAZyDVEUTxvdNIxY+efuWI9IdO/AfVTE4D1NXB9jdIzQ0jnZt3w7pUvgr74mLM
         YdwjNdS2GP2jLXEPq3404R5fFks6fp4+UhAYKzRMI1eWCx5FVsnZ9SfBZOUTKBkG5AXR
         suMv0we+UR3yBxVDN86D6/8OMrZBginLqV4QQfAk4ixhImZJv9T/XyKuLluVJhTjKRoA
         cLfA==
X-Forwarded-Encrypted: i=1; AHgh+RrqVpD9QWojSvLPVaVT4hmWc5T6cNjZTvXNWI6gUAI1xTYoQpWvTK0tkdZ2XULBdIfAVCCVAyzzCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVsbftSh9bPwVxkzShRnAwv8wAFIrKuwzwCAUqXVJ1kMawYX2q
	k88hcKpKk8V2GkZiV2efTXu+IMwnT5Q6/NHg8UcycQuVfnDCwJoPQ2peWmj6fDoS+JiSNuuxHKq
	PMhdOEdM=
X-Gm-Gg: AfdE7cmSJWj7Kvt5WAe5asVGIYbbZ0G8mnfLLPyMazL7vMoZzjjxIZ5//LmvHzHv78+
	hL8D/7D3+082xTAIybTdqlMK429RDLacDRdKmFQ9Bt8HmUALW3N3OpGUx8eClZi0rr96JLFz5+M
	EiW3rreg7oGYw84n3TZrc8ji+MWZYDLzGcKvUSD+Q48tj6vQI+lwnJpOdJgYM1yfqLLbaZAZOE2
	EFeatNVQxVaNpZXdD8bSPho4UnRiR3YzEp6QHgMyb7WcFhsPCXzvYt+WEpDnyYrF8hJhlkdK3Zv
	oQTmI+uyRVrNOZc+QVXQ3+IzbmKxd2HiZg9KtviGMe0Im1LUXGI2fqugX3J67xsDnNPBKvoq74B
	LuLrbqE7+MegLCmm7K0hTTkWfkGANCfExfEo6HkkL5Pnd7zZgyNwWt+e2Al4OfccZsKGwQM/fcl
	xOQaVjER+Znp5l
X-Received: by 2002:a05:6214:2487:b0:8ce:aace:eaf7 with SMTP id 6a1803df08f44-8fec246fde7mr144215156d6.39.1783687868337;
        Fri, 10 Jul 2026 05:51:08 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm40299876d6.35.2026.07.10.05.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:51:07 -0700 (PDT)
Message-ID: <9de024d9-c7a8-4291-a79d-83acc77b261d@riscstar.com>
Date: Fri, 10 Jul 2026 07:51:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ak9KzNFF26B0Kttz@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 2:16 AM, Andy Shevchenko wrote:
>> +		if (IS_ERR(k1->phy[i])) {
>> +			if (PTR_ERR(k1->phy[i]) == -ENODEV)
>> +				break;
>> +
>> +			return PTR_ERR(k1->phy[i]);
>> +		}
> 		if (PTR_ERR(k1->phy[i]) == -ENODEV)
> 			break;
> 		if (IS_ERR(k1->phy[i]))
> 			return PTR_ERR(k1->phy[i]);

I'm not sure this is a huge improvement.  Checking IS_ERR()
before using PTR_ERR() is comforting (a little along the
lines of the other issue you mentioned--assigning a result
before checking for an error).  Anyway, it's a little bit
of an ugly construct no matter how you do it.  Here's another
possible way to do it.

	k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
	if (!IS_ERR(k1->phy[i]))
		continue;

	ret = PTR_ERR(k1->phy[i]);
	if (ret == -ENODEV)
		break;

	return ret;

					-Alex
