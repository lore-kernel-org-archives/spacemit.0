Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0D441033
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 11:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769082694; cv=none; b=fkZlZD4bskN2zz60tkpk0mcUlohHmd5qPirDBmZ8OcqD55uC/o8syeyt95g79pRAmV4OFhfauo3N8xGr6ys+k+7iqM1235LI2JhRu+D4uzgZN4PalqEGpk+BsewjoF3poSPP84qKaLWrUasEkXLHyDae5uwY5BR9PDCf8AVg3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769082694; c=relaxed/simple;
	bh=7KL1VMVD3OFpbZXu6ToVT7ahy8hRxRMUgANKnvOVq7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DoR3EqEMUooGESSiXAoluKrZ3WULmcA+h9fmMEosBcG7kWOvFTCjbvhbLrHq61kvPOLl/lvFRosybrFu/XyvLXth47UwSNAgmmLXb3vx04Mt9oUyLEER1DZYN8TT3jy2Xh8jkGlIKQezkK9F5Aq/jf2OKBxPSP1drX4sGvEmvOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3YJwLdg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3YJwLdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769082691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7JTm3xpnzgFJS91sLL+soLriB/Qr5GTFc7WAwtsXhWA=;
	b=B3YJwLdgWu0sH03BtW89nqfch15u7M8VedXgRiUuPaAvYkI4ZafaU1nNt6+V9NTAAioUNK
	2t1Pb3AyLvKARQMIWO3p680LXbsWrL9vVP54l3o82eOZHbRzGiCMUx/95JWW2vul6GbSMa
	641uuwQr4Ha8+ls9659P2pO/vqAABNg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-3uD1FCZePwmLhcJ-Xkrprw-1; Thu, 22 Jan 2026 06:51:30 -0500
X-MC-Unique: 3uD1FCZePwmLhcJ-Xkrprw-1
X-Mimecast-MFC-AGG-ID: 3uD1FCZePwmLhcJ-Xkrprw_1769082689
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4359d70faa2so593266f8f.1
        for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 03:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082689; x=1769687489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JTm3xpnzgFJS91sLL+soLriB/Qr5GTFc7WAwtsXhWA=;
        b=L/l42Edpsp4j/iQ0XQd+ROI5byw1zQmgzyq8FJgnWMlWRcC5mFpjKyhPO/Xn+oDlTr
         +yXyNBct74UaGqZeGaJ+OxIMJnbOvVyN7Oe0SibFK5nJN5gjfmgYgMUHeqoSrz3i5bbq
         wdXPA3qEqiII90hY8LnyeLiH/iBzolTjgvq8ZZGH1mvQIiVtudodWCgeUDQ80Z9zCvuj
         OT6UffBN/dMtcORQWSd/WbqjUidoHr1nXBE8/QtIoOLMlcpjorV19gp7Iz0rZQyw3QMv
         ywS6BQgKKncZcPzPlFWJ5wtRhEv7YFKnLt/pmqzQ326IiJESjJxbDI+XzhJ22Et05RwV
         +D7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWexk4PqaElUxh4NQiuZpP+y9gWLL6fIiNeS+No+g4T1XY/viHypwUmQQJiLbUzaoaP/LEsY/tVQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoQIW3DdygQQy/dFDbTXUkW5BEIQF08oOxEVdGjCdUe3Nc2mjX
	4JmcH1673uJYvpde7nJ+28uok8im6J96ITT/LJAWxXjUvFSgqXhRf54RPIMcKdjXR0oNX8+0PbU
	65KfS/2TlxkL3nkqk8CzIAtEdZ+dqnTodl99zbRrikNzfzlddHZ6jhp+Huv7T
X-Gm-Gg: AZuq6aLheZ8240ZwfbaGsiNFFCyRR26gq/wyD7Ent4WfVRNYADjLvndPihuK5yak9w3
	15onHftzMQb8NHrHtrbBe8bdqISP/2W4I9lG5536fhyjZG6HQPMDx6rdiOxfaQgaXT1exkGKtQC
	aizLkLPmXT088sbkwLphbtIWUnpQHf6tAbB//8uN/CxIo3q38jhmM/3lPs8soiUHc6ojuzhXHM+
	eR7ASQCnsAxDf9c3vTN4uJG7JofgORd1cc36FUmvR8T6P3fLr66pxnNg9Clj0O62Z+q+bw+nHZX
	2ycHRYV5W3XX9BJZ6mNraoHwRnZUUnDtCmN0EDLgscEMYmf5sjMW/udvdsoSCTcDSTPFqeAs4Hg
	WyVwexHujrG8B
X-Received: by 2002:a5d:5d83:0:b0:425:769e:515a with SMTP id ffacd0b85a97d-4356a05c0bcmr32153857f8f.42.1769082689342;
        Thu, 22 Jan 2026 03:51:29 -0800 (PST)
X-Received: by 2002:a5d:5d83:0:b0:425:769e:515a with SMTP id ffacd0b85a97d-4356a05c0bcmr32153818f8f.42.1769082688972;
        Thu, 22 Jan 2026 03:51:28 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm21693720f8f.11.2026.01.22.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:51:28 -0800 (PST)
Message-ID: <d9170bdd-140f-4d36-954d-76223e31b209@redhat.com>
Date: Thu, 22 Jan 2026 12:51:26 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
To: Vivian Wang <wangruikang@iscas.ac.cn>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Yixun Lan <dlan@gentoo.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
 <20260121200439.64c22125@kernel.org>
 <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <5639ff0c-dfd1-4528-a0ce-92d3c457ce64@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9fO8l8FEm7nUagOoXxZP-tGNdQPDL7dQDHmO-HZ7M-M_1769082689
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/22/26 11:39 AM, Vivian Wang wrote:
> On 1/22/26 12:04, Jakub Kicinski wrote:
>> On Wed, 21 Jan 2026 10:17:18 +0800 Vivian Wang wrote:
>>> This patch isn't a fix for the problem per se, since it is hardware
>>> behavior. The new message and comments, however, should direct those
>>> running into this on new hardware towards a fix.
>> Is it not possible to improve the situation?
> 
> Maybe I should have made it clearer, but this comment and messages
> improvement was proposed by Andrew in the linked thread [1].
> 
> As an aside, saying that made me realize this patch should be:
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> 
>> Is the refclock disappearing because of power saving?
>> Or because the link is down?
> 
> I'm not really well-versed in what's allowed from the PHY here, but at
> least the Motorcomm and Realtek PHYs seem to only stop this clock while
> the link is down. So from what I can tell it's PHY stopping the clock
> because of power saving for when the link is down. I'm not sure how that
> should translate into an answer to your question here...
> 
>> Because if it's the latter we should be able to skip reading the stats
>> when link is down (still racy but better than waiting in cases we can
>> detect?)
> 
> If checking the link is definitely up as a condition for updating stats
> would be acceptable, then maybe the original patch from the linked
> thread [2] can also be adopted?

My understanding is that such option would fit Jakub's suggestion. Note
that the commit message should be expanded and clarified WRT the
original submission.

/P

