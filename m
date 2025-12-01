Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7FD3101A0
	for <spacemit@lists.linux.dev>; Mon,  1 Dec 2025 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596980; cv=none; b=GTAWD3Oo7SL5w21p5GnXt5jw7efodd3Ha9GxhEQoEbfI2i0fRBnoTJBVDp0yt8j4K5Au+NSZurMmGj10KLBel9SWXqiLUSJn3U7Cd12zBGKHeNThcJL6Uyv6SjcCXAWlQ/OOmZvk5f3nKZgm9y+xcUQbmMV2qOVKG6+xv9T92HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596980; c=relaxed/simple;
	bh=cdi6DcHRWFscT6nczs9XNOPxCGQm6KnVYiqffJ8Ry0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5yph2cpS/Kp3EofP3Q3hxxk4Aa+LXESEbcXoaQ+9KxUXQHty0OEUDb7CycF5ZY4S7U4XG7HhW1BfNGXwwmLTjysjo3an/eB73eVpUYCFE1xc8VVEoFjDWLVPk1J7/Jd76E/8WQeYNMiPA2QGKz/jJ69SE0Bmbece77iQCuEx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=j+y1rH7i; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="j+y1rH7i"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-9490b441c3bso193422539f.0
        for <spacemit@lists.linux.dev>; Mon, 01 Dec 2025 05:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764596977; x=1765201777; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LX4Z8WF4/u+atBhlBwzBrhy4vIEbhmKBOl8pVRCNa2E=;
        b=j+y1rH7inRgA9+R+fS2MMMNG9vgl+DSFwRLxytPGN1IsCB1WJhFQDR/92b9LcqTnlP
         uGVi6dJ4/gBRdOFa5ZupWaILhVUZa/b5XoyecFXvtlWyXNLAVQ4XO2CDSk1o7RXMjiYq
         2QUfqfVjMSGqJiNPTicMZzLCxYzNM1hysuh/0Lrhh0yaV0IKtJf5Fg4hdJkK/VwVApCg
         SuZI6EQEQWTJT+BbM7VTdIQQKEQmTsZV074AS0YlcMKvNpJmFRi/Y8dKsfaw0v6nndjc
         ceM5AA/a9dGdOoK6hbZ+mRHy15/IA7gccvANkvE1+i51yDGReOpZ35HUoxCboeJcyhfY
         vZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596977; x=1765201777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LX4Z8WF4/u+atBhlBwzBrhy4vIEbhmKBOl8pVRCNa2E=;
        b=iWWS+BPN8ea9AZGudUVYZ4s0+TeZi1/qY7fQijoZJX+98PmQRoxywADyYu030x3cI8
         Phyik6NHSTo+NF8NcvgRSXcNkEKIzMCOJnDipTxJQjCbSF0fjf0mrUMZvBxu1/K28gkt
         EX/ZkL1isMWkbx/iq1rHbLtSlRIDXhMG8BCImWLsgvcUH+x09abHwXE8ExSOLm7Dcqcq
         2FRRB/gk2M2gBfVqXO1pTZD7/dvS844lDvZuAImbpb0J1CcG2lV5aBEbxHLDoxqq5F0M
         1nYDy3cCMEy2Q4oLXvOEiqepJ80ygRHZmVnKscbaxqniItPFif11nnpPachEVGihQlAz
         Dyag==
X-Forwarded-Encrypted: i=1; AJvYcCX0U1ppDaQd2H0BErPXjmzL6m88OOQfIhO16OiK83QimLc+rlM/bYkrlW+Rpk9sFWZrsfR5zv9ltA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgKuQC8R2IAk42vplD9GdVy8996IM9+hNeaVGj/tGy9afNUR+t
	9w2alN0RI7ASQAy8lTZwiuAMdh2C9Y5PFbWpy08QossgHAxaPscNsEhGYjS7C0W0QvA=
X-Gm-Gg: ASbGncuPlu0kL4zsnvhqIueIBqrY6mok6BBkS7u7xLzQ4BVFwiJ0PofXcLSRG358yD6
	twEfK+pSfatTxhreyAx/pSPDxmRnibOD2T7GCA/QQRhUKO7IO6rVGxnObM4yD7i3WZ5EoBsHV1v
	26RThTApZx6ghFDSdh/CenSs7IFOd9LXX0LjtJ3OndNRbzUdXcZ889a+Ix1ba9/lizRJjin0ZII
	d96VxSpstbJUGLatz03mPaANPUEtdJkHTbVsxvM6KUJ0suVGtlZwCQQCCJUV6VYqlpql/Zfj/t+
	tdlKK3ekbzofeOTjOVaXOg+7QFawearbTNmKBoQi9MhhlKeXHADMxYZL181UiIzBY5m+5Qg5TJb
	ps0adVC4LGqLWJ8UkrMlAemH6QSuVPcJy5GbwqyX9JjakgJcOR55+22XINz7woeu67aSfuCL8ph
	ejvpDPcM6sdE7vW3B2N75qfsbiwm31vPLuV8yNBqznnuTKIG+4/Q==
X-Google-Smtp-Source: AGHT+IGpW4lDtcEJPQ43JCM3nfwACbMBWQNMoO/13AWgIOHeyQlkqEJM34cP/OgXfBBv5XVqjVJ6NA==
X-Received: by 2002:a05:6602:6411:b0:948:a6b9:3d08 with SMTP id ca18e2360f4ac-949488ae3b6mr3137565939f.3.1764596976940;
        Mon, 01 Dec 2025 05:49:36 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9498fbee405sm609850439f.8.2025.12.01.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:49:36 -0800 (PST)
Message-ID: <bd9680a1-5b91-4e80-890b-8331ce8ef302@riscstar.com>
Date: Mon, 1 Dec 2025 07:49:34 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] phy: spacemit: Introduce PCIe/combo PHY
To: Neil Armstrong <neil.armstrong@linaro.org>, vkoul@kernel.org,
 kishon@kernel.org
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, aurelien@aurel32.net,
 guodong@riscstar.com, linux-phy@lists.infradead.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
 <20251113214540.2623070-5-elder@riscstar.com>
 <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 2:56 AM, Neil Armstrong wrote:
> 
> Anyway, no big comment on the code or the API usage, all looks good:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Vinod, I never saw any indication this would be merged
(and the bindings in patches 1 and 2).  Was November 18
too late for the 6.18 release?

Should I expect someone else to take this PHY driver?

Thanks.

					-Alex
